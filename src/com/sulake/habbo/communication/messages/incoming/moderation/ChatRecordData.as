package com.sulake.habbo.communication.messages.incoming.moderation
{
    import flash.utils.Dictionary;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ChatRecordData 
    {
        public static const _Str_22117:int = 0;
        public static const _Str_16239:int = 1;
        public static const _Str_16666:int = 2;
        public static const _Str_16166:int = 3;
        public static const _Str_16975:int = 4;
        public static const _Str_7751:int = 5;
        public static const _Str_17666:int = 6;

        private var _recordType:int;
        private var _context:Dictionary;
        private var _chatlog:Array;

        public function ChatRecordData(k:IMessageDataWrapper)
        {
            var _local_6:String;
            var _local_7:int;
            this._context = new Dictionary();
            this._chatlog = new Array();
            super();
            this._recordType = k.readByte();
            var _local_2:int = k.readShort();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_6 = k.readString();
                _local_7 = k.readByte();
                switch (_local_7)
                {
                    case 0:
                        this._context[_local_6] = k.readBoolean();
                        break;
                    case 1:
                        this._context[_local_6] = k.readInteger();
                        break;
                    case 2:
                        this._context[_local_6] = k.readString();
                        break;
                    default:
                        throw (new Error(("Unknown data type " + _local_7)));
                }
                _local_3++;
            }
            var _local_4:int = k.readShort();
            var _local_5:int;
            while (_local_5 < _local_4)
            {
                this._chatlog.push(new _Str_6779(k));
                _local_5++;
            }
        }

        public function get _Str_24276():int
        {
            return this._recordType;
        }

        public function get context():Dictionary
        {
            return this._context;
        }

        public function get chatlog():Array
        {
            return this._chatlog;
        }

        public function get roomId():int
        {
            return this._Str_14937("roomId");
        }

        public function get roomName():String
        {
            return this._context["roomName"] as String;
        }

        public function get groupId():int
        {
            return this._Str_14937("groupId");
        }

        public function get threadId():int
        {
            return this._Str_14937("threadId");
        }

        public function get messageId():int
        {
            return this._Str_14937("messageId");
        }

        private function _Str_14937(k:String):int
        {
            var _local_2:* = this._context[k];
            if (_local_2 == null)
            {
                return 0;
            }
            return _local_2 as int;
        }
    }
}
