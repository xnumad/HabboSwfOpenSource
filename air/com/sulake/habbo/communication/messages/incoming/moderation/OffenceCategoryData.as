//com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData

package com.sulake.habbo.communication.messages.incoming.moderation{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class OffenceCategoryData implements INamed, IDisposable {

        private var _name:String;
        private var _autoAlert:Boolean;
        private var _offences:Array;
        private var _disposed:Boolean;

        public function OffenceCategoryData(k:IMessageDataWrapper);

        public function dispose():void;

        public function get disposed():Boolean;

        public function get name():String;

        public function get offences():Array;

        public function get autoAlert():Boolean;


    }
}//package com.sulake.habbo.communication.messages.incoming.moderation

