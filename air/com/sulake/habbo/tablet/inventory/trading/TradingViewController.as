//com.sulake.habbo.tablet.inventory.trading.TradingViewController

package com.sulake.habbo.tablet.inventory.trading{
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import com.sulake.habbo.tablet.inventory.HabboTabletInventory;
    import feathers.controls.LayoutGroup;
    import feathers.controls.Label;
    import feathers.controls.Button;
    import flash.utils.Timer;
    import feathers.controls.Callout;
    import feathers.core.FeathersControl;
    import starling.events.Event;
    import starling.textures.Texture;
    import flash.events.TimerEvent;

    public class TradingViewController implements IAvatarImageListener {

        public static const ALERT_SCAM:int;
        public static const ALERT_OTHER_CANCELLED:int;
        public static const ALERT_ALREADY_OPEN:int;
        public static const ALERT_COMMIT_ERROR:int;
        public static const ALERT_SUCCESS:int;
        private static const CONFIRMATION_TIMEOUT:int;

        private var _inventory:HabboTabletInventory;
        private var _view:LayoutGroup;
        private var _infoLabel:Label;
        private var _ownOffer:TradingOfferView;
        private var _otherOffer:TradingOfferView;
        private var _buttons:LayoutGroup;
        private var _acceptButton:Button;
        private var _modifyButton:Button;
        private var _confirmButton:Button;
        private var _cancelButton:Button;
        private var _confirmationTimer:Timer;
        private var _isDisposed:Boolean;
        private var _chatCallout:Callout;

        public function TradingViewController(k:HabboTabletInventory);

        public static function alertPopup(k:int):void;

        public static function showTradingNotAllowed(k:Boolean):void;

        private static function calloutFactory():Callout;


        public function dispose():void;

        public function get view():FeathersControl;

        private function onOwnOfferListChange(k:Event):void;

        public function update():void;

        private function getHeadTexture(k:int):Texture;

        private function onConfirmationTimerComplete(k:TimerEvent):void;

        private function onAccept(k:Event):void;

        private function onModify(k:Event):void;

        private function onConfirm(k:Event):void;

        private function onCancel(k:Event):void;

        public function updateChat(k:String):void;

        public function avatarImageReady(k:String):void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.tablet.inventory.trading

