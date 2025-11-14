USE [Joels_Training]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[protocols](
	[id] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[DLLName] [varchar](255) NOT NULL,
	[Description] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT INTO protocols (id, Name, DLLName, Description) VALUES
(4,'IEC 60870-5-101','iec101','IEC 60870-5-101 Protocol'),
(5,'IEC 60870-5-104','iec104','IEC 60870-5-104 Protocol'),
(6,'Modbus RTU','modbusrtu','Modbus RTU Protocol'),
(7,'Modbus TCP','modbustcp','Modbus TCP Protocol'),
(8,'OPC Classic','opc','OPC Data Access Protocol'),
(9,'OPC UA','opcua','OPC Unified Architecture Protocol'),
(10,'DLMS/COSEM','dlms','Device Language Message Specification'),
(11,'MQTT','mqtt','Message Queuing Telemetry Transport'),
(12,'REST API','restapi','HTTP REST Integration'),
(13,'FTP','ftp','File Transfer Protocol'),
(14,'SFTP','sftp','Secure File Transfer Protocol'),
(15,'SNMP','snmp','Simple Network Management Protocol'),
(16,'BACnet','bacnet','Building Automation and Control Network'),
(17,'IEC 61850','iec61850','Communication Networks and Systems for Power Utility Automation'),
(18,'ICCP/TASE.2','iccp','Inter-Control Center Communications Protocol'),
(19,'C37.118','c37118','IEEE Synchrophasor Protocol'),
(20,'Profinet','profinet','Industrial Ethernet Protocol'),
(21,'EtherNet/IP','ethernetip','EtherNet Industrial Protocol'),
(22,'CANopen','canopen','CAN-based Automation Protocol'),
(23,'M-Bus','mbus','Meter-Bus Protocol'),
(24,'Zigbee','zigbee','Wireless Communication Protocol'),
(25,'LoRaWAN','lorawan','Long Range Wide Area Network Protocol'),
(26,'JSON-RPC','jsonrpc','Remote Procedure Call Protocol using JSON');

INSERT INTO protocols (id, Name, DLLName, Description) VALUES
(31,'CoAP','coap','Constrained Application Protocol'),
(32,'AMQP','amqp','Advanced Message Queuing Protocol'),
(33,'DDS','dds','Data Distribution Service'),
(34,'ZeroMQ','zeromq','High-performance asynchronous messaging library'),
(35,'gRPC','grpc','Remote Procedure Calls using HTTP/2'),
(36,'SOAP','soap','Simple Object Access Protocol'),
(37,'HTTP','http','Hypertext Transfer Protocol'),
(38,'HTTPS','https','Secure HTTP Protocol'),
(39,'WebSocket','websocket','Full-duplex communication over TCP'),
(40,'SSH','ssh','Secure Shell Protocol'),
(41,'Telnet','telnet','Network communication protocol'),
(42,'SMTP','smtp','Simple Mail Transfer Protocol'),
(43,'POP3','pop3','Post Office Protocol v3'),
(44,'IMAP','imap','Internet Message Access Protocol'),
(45,'NTP','ntp','Network Time Protocol'),
(46,'TFTP','tftp','Trivial File Transfer Protocol'),
(47,'LDAP','ldap','Lightweight Directory Access Protocol'),
(48,'RADIUS','radius','Remote Authentication Dial-In User Service'),
(49,'Diameter','diameter','Authentication, Authorization, and Accounting protocol'),
(50,'SIP','sip','Session Initiation Protocol'),
(51,'RTP','rtp','Real-time Transport Protocol'),
(52,'RTSP','rtsp','Real Time Streaming Protocol'),
(53,'MQ','mq','IBM Message Queue'),
(54,'ActiveMQ','activemq','Open source message broker'),
(55,'Kafka','kafka','Distributed event streaming platform'),
(56,'RabbitMQ','rabbitmq','Message broker software'),
(57,'Redis Pub/Sub','redis','Redis Publish/Subscribe Messaging'),
(58,'Azure IoT Hub','azureiothub','Azure IoT Device Connectivity'),
(59,'AWS IoT Core','awsiot','Amazon IoT Device Connectivity'),
(60,'Google IoT Core','googleiot','Google Cloud IoT Protocol'),
(61,'IEC 62056','iec62056','DLMS/COSEM for Energy Metering'),
(62,'IEC 60870-6','iec608706','Inter-Control Center Communication Protocol'),
(63,'IEC 61400-25','iec6140025','Wind Power Plant Communication'),
(64,'IEC 61968','iec61968','Application Integration at Utility Enterprises'),
(65,'IEC 61970','iec61970','CIM for Energy Management Systems'),
(66,'DALI','dali','Digital Addressable Lighting Interface'),
(67,'KNX','knx','Home and Building Control Protocol'),
(68,'EnOcean','enocean','Energy Harvesting Wireless Standard'),
(69,'Z-Wave','zwave','Home Automation Wireless Protocol'),
(70,'Thread','thread','Low-power Mesh Networking Protocol'),
(71,'Bluetooth LE','ble','Bluetooth Low Energy'),
(72,'Wi-SUN','wisun','Wireless Smart Utility Network'),
(73,'NB-IoT','nbiot','Narrowband Internet of Things'),
(74,'Sigfox','sigfox','Low Power Wide Area Network'),
(75,'LTE Cat-M1','ltem1','Cellular IoT Protocol'),
(76,'5G IoT','5giot','5G Internet of Things Connectivity'),
(77,'IEC CIM','iecCIM','Common Information Model Data Exchange'),
(78,'IEC 62325','iec62325','Energy Market Communications'),
(79,'XMPP','xmpp','Extensible Messaging and Presence Protocol'),
(80,'SMQP','smqp','Smart Meter Query Protocol'),
(81,'PMU Stream','pmu','Phasor Measurement Unit Data Stream'),
(82,'Telemetry UDP','teleudp','UDP-based Telemetry Data Protocol'),
(83,'Telemetry TCP','teletcp','TCP-based Telemetry Data Protocol'),
(84,'SCPI','scpi','Standard Commands for Programmable Instruments'),
(85,'IEC 61107','iec61107','Legacy Meter Protocol'),
(86,'IEC 870-5-102','iec8705102','Transmission Protocol for DC Measurements'),
(87,'IEC 870-5-103','iec8705103','Protection Equipment Protocol'),
(88,'IEC 870-5-105','iec8705105','Telecontrol Protocol Extension'),
(89,'IEC 60870-5-109','iec8705109','New Extensions for Telecontrol Communication'),
(90,'JSON API','jsonapi','Web API using JSON'),
(91,'XML-RPC','xmlrpc','Remote Procedure Call with XML'),
(92,'YAML-RPC','yamlrpc','RPC protocol using YAML'),
(93,'Protobuf-RPC','protobufrpc','RPC using Google Protocol Buffers'),
(94,'FlatBuffers-RPC','flatbuffersrpc','Fast Binary RPC Protocol'),
(95,'Avro-RPC','avrorpc','RPC based on Apache Avro'),
(96,'SMNPv3','snmpv3','Enhanced SNMP Protocol Version 3'),
(97,'IEC 60870-5-601','iec608705601','Local Network Communication Standard'),
(98,'IEC 60870-5-701','iec608705701','Interoperability Extension'),
(99,'IEC 61850-9-2','iec6185092','Sampled Values Communication'),
(100,'IEC 61850-GOOSE','iec61850goose','Generic Object-Oriented Substation Event Messaging');



