package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.room.engine.SlideObjectMessageData;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SlideObjectBundleMessageParser implements IMessageParser
    {
        private var _id:int;
        private var _objectList:Array;
        private var _avatar:SlideObjectMessageData = null;


        public function get id():int
        {
            return this._id;
        }

        public function get avatar():SlideObjectMessageData
        {
            return this._avatar;
        }

        public function get objectList():Array
        {
            return this._objectList;
        }

        public function flush():Boolean
        {
            this._id = -1;
            this._avatar = null;
            this._objectList = [];
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var userIndex:int;
            var movedObject:SlideObjectMessageData;
            var oldVector:Vector3d;
            var newVector:Vector3d;
            var oldZ:Number;
            var newZ:Number;
            if (k == null)
            {
                return false;
            }
            var oldX:Number = k.readInteger();
            var oldY:Number = k.readInteger();
            var newX:Number = k.readInteger();
            var newY:Number = k.readInteger();
            var movedObjects:int = k.readInteger();
            this._objectList = new Array();
            var _local_13:int;
            while (_local_13 < movedObjects)
            {
                userIndex = k.readInteger();
                oldZ = Number(k.readString());
                newZ = Number(k.readString());
                oldVector = new Vector3d(oldX, oldY, oldZ);
                newVector = new Vector3d(newX, newY, newZ);
                movedObject = new SlideObjectMessageData(userIndex, oldVector, newVector);
                this._objectList.push(movedObject);
                _local_13++;
            }
            this._id = k.readInteger(); //furni itemId
            if (!k.bytesAvailable)
            {
                return true;
            }
            //Moved avatar
            var type:int = k.readInteger();
            switch (type)
            {
                case 0:
                    break;
                case 1:
                    userIndex = k.readInteger();
                    oldZ = Number(k.readString());
                    newZ = Number(k.readString());
                    oldVector = new Vector3d(oldX, oldY, oldZ);
                    newVector = new Vector3d(newX, newY, newZ);
                    this._avatar = new SlideObjectMessageData(userIndex, oldVector, newVector, SlideObjectMessageData.MV);
                    break;
                case 2:
                    userIndex = k.readInteger();
                    oldZ = Number(k.readString());
                    newZ = Number(k.readString());
                    oldVector = new Vector3d(oldX, oldY, oldZ);
                    newVector = new Vector3d(newX, newY, newZ);
                    this._avatar = new SlideObjectMessageData(userIndex, oldVector, newVector, SlideObjectMessageData.SLD);
                    break;
                default:
                    Logger.log("** Incompatible character movetype!");
            }
            return true;
        }
    }
}
