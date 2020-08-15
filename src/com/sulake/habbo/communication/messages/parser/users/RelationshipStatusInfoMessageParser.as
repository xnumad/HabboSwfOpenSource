package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.communication.messages.incoming.users.RelationshipStatusInfo;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RelationshipStatusInfoMessageParser implements IMessageParser
    {
        private var _userId:int;
        private var _relationshipStatusMap:Map;


        public function flush():Boolean
        {
            if (this._relationshipStatusMap)
            {
                this._relationshipStatusMap.dispose();
                this._relationshipStatusMap = null;
            }
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_4:RelationshipStatusInfo;
            this._userId = k.readInteger();
            this._relationshipStatusMap = new Map();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = new RelationshipStatusInfo(k);
                this._relationshipStatusMap.add(_local_4._Str_24791, _local_4);
                _local_3++;
            }
            return true;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get relationshipStatusMap():Map
        {
            return this._relationshipStatusMap;
        }
    }
}
