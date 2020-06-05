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
            var _local_7:int;
            var _local_8:SlideObjectMessageData;
            var _local_9:Vector3d;
            var _local_10:Vector3d;
            var _local_11:Number;
            var _local_12:Number;
            if (k == null)
            {
                return false;
            }
            var _local_2:Number = k.readInteger();
            var _local_3:Number = k.readInteger();
            var _local_4:Number = k.readInteger();
            var _local_5:Number = k.readInteger();
            var _local_6:int = k.readInteger();
            this._objectList = new Array();
            var _local_13:int;
            while (_local_13 < _local_6)
            {
                _local_7 = k.readInteger();
                _local_11 = Number(k.readString());
                _local_12 = Number(k.readString());
                _local_9 = new Vector3d(_local_2, _local_3, _local_11);
                _local_10 = new Vector3d(_local_4, _local_5, _local_12);
                _local_8 = new SlideObjectMessageData(_local_7, _local_9, _local_10);
                this._objectList.push(_local_8);
                _local_13++;
            }
            this._id = k.readInteger();
            if (!k.bytesAvailable)
            {
                return true;
            }
            var _local_14:int = k.readInteger();
            switch (_local_14)
            {
                case 0:
                    break;
                case 1:
                    _local_7 = k.readInteger();
                    _local_11 = Number(k.readString());
                    _local_12 = Number(k.readString());
                    _local_9 = new Vector3d(_local_2, _local_3, _local_11);
                    _local_10 = new Vector3d(_local_4, _local_5, _local_12);
                    this._avatar = new SlideObjectMessageData(_local_7, _local_9, _local_10, SlideObjectMessageData.MV);
                    break;
                case 2:
                    _local_7 = k.readInteger();
                    _local_11 = Number(k.readString());
                    _local_12 = Number(k.readString());
                    _local_9 = new Vector3d(_local_2, _local_3, _local_11);
                    _local_10 = new Vector3d(_local_4, _local_5, _local_12);
                    this._avatar = new SlideObjectMessageData(_local_7, _local_9, _local_10, SlideObjectMessageData.SLD);
                    break;
                default:
                    Logger.log("** Incompatible character movetype!");
            }
            return true;
        }
    }
}
