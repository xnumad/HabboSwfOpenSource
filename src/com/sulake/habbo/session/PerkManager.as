package com.sulake.habbo.session
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageEvent;
    import flash.utils.Dictionary;
    import com.sulake.habbo.communication.messages.incoming.perk._Str_3277;
    import com.sulake.habbo.communication.messages.parser.perk._Str_3818;
    import com.sulake.habbo.session.events.PerksUpdatedEvent;

    public class PerkManager implements IDisposable 
    {
        private var _ready:Boolean = false;
        private var _sessionDataManager:SessionDataManager;
        private var _perkAllowancesMessageEvent:IMessageEvent;
        private var _perks:Dictionary;

        public function PerkManager(k:SessionDataManager)
        {
            this._perks = new Dictionary();
            super();
            this._sessionDataManager = k;
            if (this._sessionDataManager.communication)
            {
                this._perkAllowancesMessageEvent = this._sessionDataManager.communication.addHabboConnectionMessageEvent(new _Str_3277(this.onPerkAllowances));
            }
        }

        public function get disposed():Boolean
        {
            return this._sessionDataManager == null;
        }

        public function dispose():void
        {
            var k:String;
            if (this.disposed)
            {
                return;
            }
            if (this._perks)
            {
                for (k in this._perks)
                {
                    delete this._perks[k];
                }
                this._perks = null;
            }
            if (this._sessionDataManager.communication)
            {
                this._sessionDataManager.communication.removeHabboConnectionMessageEvent(this._perkAllowancesMessageEvent);
            }
            this._perkAllowancesMessageEvent = null;
            this._sessionDataManager = null;
        }

        public function get isReady():Boolean
        {
            return this._ready;
        }

        public function isPerkAllowed(k:String):Boolean
        {
            return (k in this._perks) && (this._perks[k].isAllowed);
        }

        public function getPerkErrorMessage(k:String):String
        {
            var _local_2:_Str_3818 = this._perks[k];
            return (_local_2 != null) ? _local_2.errorMessage : "";
        }

        private function onPerkAllowances(k:_Str_3277):void
        {
            var _local_2:_Str_3818;
            for each (_local_2 in k.getParser()._Str_23301())
            {
                this._perks[_local_2.code] = _local_2;
            }
            this._ready = true;
            this._sessionDataManager.events.dispatchEvent(new PerksUpdatedEvent());
        }
    }
}
