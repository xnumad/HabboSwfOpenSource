//com.sulake.habbo.notification.MessageDisplay

package com.sulake.habbo.notification{
    import com.sulake.habbo.ui.HabboUI;
    import feathers.controls.Alert;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.session.events.RoomSessionEvent;
    import com.sulake.habbo.communication.messages.incoming.availability.InfoHotelClosingMessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.tablet.catalog.event.CatalogEvent;

    public class MessageDisplay {

        private var _ui:HabboUI;
        private var _alert:Alert;
        private var _localizations:IHabboLocalizationManager;

        public function MessageDisplay(k:HabboUI, _arg_2:IHabboLocalizationManager);

        public static function showAlert(k:String, _arg_2:String):void;


        public function dispose():void;

        public function roomSessionDialogEventHandler(k:RoomSessionEvent):void;

        public function showHotelClosing(k:InfoHotelClosingMessageEvent):void;

        public function showMOTD(k:IMessageEvent):void;

        public function showNotification(k:String, _arg_2:Map):void;

        public function getNotificationPart(k:Map, _arg_2:String, _arg_3:String, _arg_4:Boolean):String;

        public function getNotificationImageUrl(k:Map, _arg_2:String):String;

        private function onBuilderMembershipExpired(k:CatalogEvent):void;


    }
}//package com.sulake.habbo.notification

