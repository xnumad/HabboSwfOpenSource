//com.sulake.habbo.widgets.Doorbell

package com.sulake.habbo.widgets{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.ui.RoomDesktop;
    import com.sulake.core.communication.messages.IMessageEvent;
    import __AS3__.vec.Vector;
    import feathers.controls.Alert;
    import com.sulake.habbo.communication.messages.incoming.navigator.DoorbellMessageEvent;
    import starling.events.Event;

    public class Doorbell implements IDisposable {

        private static const TAG_ACCEPT:String;
        private static const TAG_REJECT:String;

        private var _disposed:Boolean;
        private var _desktop:RoomDesktop;
        private var _messageEvent:IMessageEvent;
        private var _ringers:Vector.<String>;
        private var _alert:Alert;
        private var _userName:String;

        public function Doorbell(k:RoomDesktop);

        public function get disposed():Boolean;

        public function dispose():void;

        private function onDoorbell(k:DoorbellMessageEvent):void;

        private function showDoorbell():void;

        private function onAlertClosed(k:Event, _arg_2:Object):void;


    }
}//package com.sulake.habbo.widgets

