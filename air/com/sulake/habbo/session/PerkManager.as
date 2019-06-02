//com.sulake.habbo.session.PerkManager

package com.sulake.habbo.session{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageEvent;
    import flash.utils.Dictionary;
    import com.sulake.habbo.communication.messages.incoming.perk.PerkAllowancesMessageEvent;

    public class PerkManager implements IDisposable {

        private var _sessionDataManager:SessionDataManager;
        private var _perkAllowancesMessageEvent:IMessageEvent;
        private var _perks:Dictionary;

        public function PerkManager(k:SessionDataManager);

        public function get disposed():Boolean;

        public function dispose():void;

        public function isPerkAllowed(k:String):Boolean;

        public function getPerkErrorMessage(k:String):String;

        private function onPerkAllowances(k:PerkAllowancesMessageEvent):void;


    }
}//package com.sulake.habbo.session

