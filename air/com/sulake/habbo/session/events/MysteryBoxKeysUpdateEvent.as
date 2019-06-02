//com.sulake.habbo.session.events.MysteryBoxKeysUpdateEvent

package com.sulake.habbo.session.events{
    import flash.events.Event;

    public class MysteryBoxKeysUpdateEvent extends Event {

        public static const MYSTERY_BOX_KEYS_UPDATE:String;

        private var _boxColor:String;
        private var _keyColor:String;

        public function MysteryBoxKeysUpdateEvent(k:String, _arg_2:String, _arg_3:Boolean=false, _arg_4:Boolean=false);

        public function get boxColor():String;

        public function get keyColor():String;


    }
}//package com.sulake.habbo.session.events

