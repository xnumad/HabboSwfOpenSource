package com.sulake.habbo.help.cfh.registry.instantmessage
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.help.HabboHelp;
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_4851;
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_4696;
    import com.sulake.habbo.communication.messages.parser.friendlist._Str_6189;
    import com.sulake.habbo.communication.messages.parser.friendlist._Str_5791;

    public class InstantMessageEventHandler implements IDisposable 
    {
        private var _component:HabboHelp;

        public function InstantMessageEventHandler(k:HabboHelp)
        {
            this._component = k;
            this._component.addMessageEvent(new _Str_4851(this._Str_24521));
            this._component.addMessageEvent(new _Str_4696(this._Str_10457));
        }

        public function _Str_24521(k:_Str_4851):void
        {
            var _local_3:String;
            var _local_4:String;
            var _local_2:_Str_6189 = k.getParser();
            if (((_local_2.senderId < 0) && (!(_local_2.extraData == null))))
            {
                _local_3 = _local_2.extraData.split("/")[2];
                _local_4 = _local_2.extraData.split("/")[0];
                this._component._Str_3977._Str_2822(_local_2.senderId, ((_local_3 + ":") + _local_4), _local_2._Str_3460);
            }
            else
            {
                this._component._Str_3977._Str_2822(_local_2.senderId, "", _local_2._Str_3460);
            }
        }

        public function _Str_10457(k:_Str_4696):void
        {
            var _local_2:_Str_5791 = k.getParser();
            this._component._Str_3977._Str_2822(_local_2.senderId, "", _local_2._Str_3460);
        }

        public function dispose():void
        {
            if (!this.disposed)
            {
                if (this._component)
                {
                    this._component = null;
                }
            }
        }

        public function get disposed():Boolean
        {
            return this._component == null;
        }
    }
}
