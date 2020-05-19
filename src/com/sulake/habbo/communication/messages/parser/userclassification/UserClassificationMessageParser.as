package com.sulake.habbo.communication.messages.parser.userclassification
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class UserClassificationMessageParser implements IMessageParser 
    {
        private var _classifiedUsersNames:Map;
        private var _classifiedUsersClass:Map;


        public function flush():Boolean
        {
            if (this._classifiedUsersNames)
            {
                this._classifiedUsersNames.dispose();
                this._classifiedUsersNames = null;
            }
            if (this._classifiedUsersClass)
            {
                this._classifiedUsersClass.dispose();
                this._classifiedUsersClass = null;
            }
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_4:String;
            var _local_5:String;
            var _local_2:int = k.readInteger();
            this._classifiedUsersNames = new Map();
            this._classifiedUsersClass = new Map();
            var _local_6:int;
            while (_local_6 < _local_2)
            {
                _local_3 = k.readInteger();
                _local_4 = k.readString();
                _local_5 = k.readString();
                this._classifiedUsersNames.add(_local_3, _local_4);
                this._classifiedUsersClass.add(_local_3, _local_5);
                _local_6++;
            }
            return true;
        }

        public function get classifiedUsernameMap():Map
        {
            return this._classifiedUsersNames;
        }

        public function get classifiedUserTypeMap():Map
        {
            return this._classifiedUsersClass;
        }
    }
}
