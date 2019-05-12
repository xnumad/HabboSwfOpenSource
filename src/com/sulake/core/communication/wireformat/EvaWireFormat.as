package com.sulake.core.communication.wireformat
{
    import flash.utils.ByteArray;
    import com.sulake.core.communication.util.Short;
    import com.sulake.core.communication.encryption.IEncryption;
    import com.sulake.core.communication.connection.IConnection;

    public final class EvaWireFormat implements IWireFormat 
    {
        private static const MAX_DATA:uint = (128 * 0x0400);//131072
		
        public function dispose():void
        {
        }

        public function encode(header:int, messageBuffer:Array):ByteArray
        {
            var buffer:ByteArray = new ByteArray();
            buffer.writeInt(0);
            buffer.writeShort(header);
            for each (var value:Object in messageBuffer)
            {
                if ((value is String))
                {
                    buffer.writeUTF((value as String));
                }
                else
                {
                    if ((value is int))
                    {
                        buffer.writeInt((value as int));
                    }
                    else
                    {
                        if ((value is Boolean))
                        {
                            buffer.writeBoolean((value as Boolean));
                        }
                        else
                        {
                            if ((value is Short))
                            {
                                buffer.writeShort((value as Short).value);
                            }
                            else
                            {
                                if ((value is ByteArray))
                                {
            						var appendingBuffer:ByteArray = (value as ByteArray);
                                    buffer.writeInt(appendingBuffer.length);
                                    buffer.writeBytes(appendingBuffer);
                                }
                            }
                        }
                    }
                }
            }
            var length:uint = buffer.length;
            buffer.position = 0;
            buffer.writeInt((length - 4));
            buffer.position = length;
            return buffer;
        }

        public function decode(buffer:ByteArray, socket:IConnection):Array
        {
            var readerIndex:uint;
            var messageLength:uint;
            var encryption:IEncryption;
            var header:int;
            var messageLengthBuffer:ByteArray;
            var dataWrapper:Array = new Array();
            while (true)
            {
                if (buffer.bytesAvailable < 6)
                {
                    return dataWrapper;
                }
                readerIndex = buffer.position;
                messageLength = 0;
                encryption = socket.getServerToClientEncryption();
                if (encryption != null)
                {	
                    encryption.mark();
                    messageLengthBuffer = new ByteArray();
                    messageLengthBuffer.writeByte(buffer.readByte());
                    messageLengthBuffer.writeByte(buffer.readByte());
                    messageLengthBuffer.writeByte(buffer.readByte());
                    messageLengthBuffer.writeByte(buffer.readByte());
            		var decipherLength:ByteArray = encryption.decipher(messageLengthBuffer);
                    messageLength = (((((0xFF & decipherLength[0]) << 24) | 
									   ((0xFF & decipherLength[1]) << 16)) | 
									   ((0xFF & decipherLength[2]) << 8))  | 
									   (0xFF & decipherLength[3]));
                }
                else
                {
                    messageLength = buffer.readInt();
                }
                if (((messageLength < 2) || (messageLength > MAX_DATA)))
                {
                    throw (new Error(("Invalid message length " + messageLength)));
                }
                if (buffer.bytesAvailable < messageLength)
                {
                    buffer.position = readerIndex;
                    if (encryption != null)
                    {
                        encryption.reset();
                    }
                    return dataWrapper;
                }
                
            	var output:ByteArray = new ByteArray();
                if (encryption != null)
                {
            		var content:ByteArray = new ByteArray();
                    content.writeBytes(buffer, buffer.position, messageLength);
                    output.writeBytes(encryption.decipher(content), 0, messageLength);
                    output.position = 0;
                }
                else
                {
                    output.writeBytes(buffer, buffer.position, messageLength);
                    output.position = 0;
                }
                buffer.position = (buffer.position + messageLength);
                header = output.readShort();
                dataWrapper.push(new EvaMessageDataWrapper(header, output));
            }
            return (null); //dead code
        }
    }
}
