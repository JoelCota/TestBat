const sql = require('mssql');
const fs = require('fs');
const path = require('path');
const ignore = require("ignore")
require('dotenv').config();

/**
 * To run
 * node validate_protocols.js <FOLDER_PATH> <DLL_IGNORE_FILE>
 */
const user = process.env.DB_USER;
const password = process.env.DB_PASS;
const server = process.env.DB_SERVER;
const database = process.env.DB_NAME;
const folderPath = process.argv[2];
const DLLIgnoreFile = process.argv[3];



if (!folderPath || !DLLIgnoreFile) {
  console.error("❌ Missing arguments.\nUsage: node validate_protocols.js <folderPath> <dllExceptionFile>");
  process.exit(1);
}

/**
 * Ignoring all the files that are registered into DLLIgnoreFile
 */
var ig = ignore();

if (DLLIgnoreFile && fs.existsSync(DLLIgnoreFile)) {
  const content = fs.readFileSync(DLLIgnoreFile, 'utf-8');
  ig = ignore().add(content);
} else {
  console.warn('No valid DLL exception file provided — proceeding without ignore files.');
}

/**
 * Database Configuration
 */
var config = {
  server: server || 'vmtesting',
  user: user || 'sa',
  password: password || 'P1nnacle',
  database: database || 'Joels_Training',
  options: {
    trustServerCertificate: true,
    encrypt: false
  }
};
console.log("Connecting with user:", config.user);

/**
 * Function to get all the names of the files that are into the path
 * @param {*} dirPath 
 * @returns the files that are part of the path with .dll extension
 */
async function getFileNames(dirPath) {
  try {
    const files = fs.readdirSync(dirPath);
    const dllFiles = files.filter(file => path.extname(file).toLowerCase() === '.dll');
    console.log(dllFiles);
    return dllFiles;
  } catch (err) {
    console.error('An error occurred:', err);
  }
}


/**
 * Database query to select all the protocols registered into the database
 * @returns the protocols that are registered into the database
 */
async function get_protocols() {
  try {
    await sql.connect(config);
    const result = await sql.query(`SELECT * FROM protocols`);
    return result.recordset;
  } catch (err) {
    console.error('Database error:', err);
  } finally {
    await sql.close();
  }
}

/**
 * Process the query to manage and adding the .dll extension
 * @returns the DLLName with .dll extension
 */
async function process_protocols() {
  try {
    const db_protocols = await get_protocols();
    const protocols = db_protocols.map(protocol => ({
      DLLName: protocol.DLLName + '.dll',
    }));
    return protocols;
  } catch (err) {
    console.error('Error processing the protocols: ', err)
  }
}

/**
 * Validate the protocols with the referenced ignored files and record the results.
 */
async function validate_protocols() {
  const dllNames = await getFileNames(folderPath);
  console.log(dllNames);
  const dllObjects = await process_protocols()

  const folderSet = new Set(dllNames);
  const objectSet = new Set(dllObjects.map(obj => obj.DLLName));

  const missingInFolder = [...objectSet].filter(name => !folderSet.has(name) && !ig.ignores(name));
  const missingInObjects = [...folderSet].filter(name => !objectSet.has(name) && !ig.ignores(name));

  if (missingInFolder.length === 0 && missingInObjects.length === 0) {
    console.log('✅ DLLs match exactly');
    process.exit(0); // success
  } else {
    console.error('❌ DLLs do not match.');
    console.error('Missing in folder:', missingInFolder);
    console.error('Missing in database:', missingInObjects);
    process.exit(1); // fail build
  }
}

validate_protocols();