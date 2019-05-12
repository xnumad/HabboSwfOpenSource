package com.sulake.habbo.communication.messages.parser.newnavigator
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.newnavigator.TopLevelContext;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import __AS3__.vec.*;

    public class NavigatorMetaDataParser implements IMessageParser 
    {
        private var _topLevelContexts:Vector.<TopLevelContext>;


        public function flush():Boolean
        {
            this._topLevelContexts = new Vector.<TopLevelContext>(0);
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._topLevelContexts.push(new TopLevelContext(k));
                _local_3++;
            }
            return true;
        }

        public function get _Str_23833():Vector.<TopLevelContext>
        {
            return this._topLevelContexts;
        }
    }
}
