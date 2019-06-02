package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Triggerable 
    {
        private var _stuffTypeSelectionEnabled:Boolean;
        private var _furniLimit:int;
        private var _stuffIds:Array;
        private var _id:int;
        private var _stringParam:String;
        private var _intParams:Array;
        private var _stuffTypeId:int;
        private var _stuffTypeSelectionCode:int;

        public function Triggerable(k:IMessageDataWrapper)
        {
            var _local_5:int;
            this._stuffIds = new Array();
            this._intParams = new Array();
            super();
            this._stuffTypeSelectionEnabled = k.readBoolean();
            this._furniLimit = k.readInteger();
            var count:int = k.readInteger();
            var index:int;
            while (index < count)
            {
                _local_5 = k.readInteger();
                this._stuffIds.push(_local_5);
                index++;
            }
            this._stuffTypeId = k.readInteger();
            this._id = k.readInteger();
            this._stringParam = k.readString();
            var _local_4:int = k.readInteger();
            index = 0;
            while (index < _local_4)
            {
                this._intParams.push(k.readInteger());
                index++;
            }
            this._stuffTypeSelectionCode = k.readInteger();
        }

        public function get stuffTypeSelectionEnabled():Boolean
        {
            return this._stuffTypeSelectionEnabled;
        }

        public function get _Str_6040():int
        {
            return this._stuffTypeSelectionCode;
        }

        public function set _Str_6040(k:int):void
        {
            this._stuffTypeSelectionCode = k;
        }

        public function get maximumItemSelectionCount():int
        {
            return this._furniLimit;
        }

        public function get selectedItems():Array
        {
            return this._stuffIds;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get stringData():String
        {
            return this._stringParam;
        }

        public function get intData():Array
        {
            return this._intParams;
        }

        public function get code():int
        {
            return 0;
        }

        public function get spriteId():int
        {
            return this._stuffTypeId;
        }

        public function getBoolean(k:int):Boolean
        {
            return this._intParams[k] == 1;
        }
    }
}
