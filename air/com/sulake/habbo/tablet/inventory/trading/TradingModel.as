//com.sulake.habbo.tablet.inventory.trading.TradingModel

package com.sulake.habbo.tablet.inventory.trading{
    import com.sulake.habbo.tablet.inventory.IInventoryModel;
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.tablet.inventory.HabboTabletInventory;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.utils.Map;
    import flash.utils.Timer;
    import feathers.data.ListCollection;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.habbo.tablet.inventory.furni.FurniModel;
    import com.sulake.habbo.tablet.inventory.items.FurnitureItem;
    import flash.display.BitmapData;
    import com.sulake.core.communication.messages.IMessageEvent;

    public class TradingModel implements IInventoryModel, IGetImageListener {

        public static const MAX_ITEMS_TO_TRADE:uint;
        public static const TRADING_STATE_READY:uint;
        public static const TRADING_STATE_RUNNING:uint;
        public static const TRADING_STATE_COUNTDOWN:uint;
        public static const TRADING_STATE_CONFIRMING:uint;
        public static const TRADING_STATE_CONFIRMED:uint;
        public static const TRADING_STATE_COMPLETED:uint;
        public static const TRADING_STATE_CANCELLED:uint;
        public static const CANCEL_REASON_COMMIT_ERROR:uint;
        public static const CANCEL_REASON_OTHER_CANCELLED:uint;

        private var _inventory:HabboTabletInventory;
        private var _assetLibrary:IAssetLibrary;
        private var _roomEngine:IRoomEngine;
        private var _communication:IHabboCommunicationManager;
        private var _localization:IHabboLocalizationManager;
        private var _disposed:Boolean;
        private var _running:Boolean;
        private var _pending:Boolean;
        private var _state:uint;
        private var _requestedUserId:int;
        private var _ownUserId:int;
        private var _ownUserName:String;
        private var _ownUserItems:Map;
        private var _ownUserAccepts:Boolean;
        private var _ownUserCanTrade:Boolean;
        private var _otherUserId:int;
        private var _otherUserName:String;
        private var _otherUserItems:Map;
        private var _otherUserAccepts:Boolean;
        private var _otherUserCanTrade:Boolean;
        private var _allowConfirmation:Boolean;
        private var _confirmationTimer:Timer;
        private var _cancelReason:int;
        private var _ownDataProvider:ListCollection;
        private var _otherDataProvider:ListCollection;

        public function TradingModel(k:HabboTabletInventory, _arg_2:IHabboCommunicationManager, _arg_3:IAssetLibrary, _arg_4:IRoomEngine, _arg_5:IHabboLocalizationManager);

        private static function populateDataProvider(k:Map, _arg_2:ListCollection):void;

        public static function getGuildFurniType(k:int, _arg_2:IStuffData):String;


        public function get running():Boolean;

        public function get pending():Boolean;

        public function get state():uint;

        public function get disposed():Boolean;

        public function get ownUserId():int;

        public function get ownUserName():String;

        public function get ownUserItems():Map;

        public function get ownUserAccepts():Boolean;

        public function get ownUserCanTrade():Boolean;

        public function get otherUserId():int;

        public function get otherUserName():String;

        public function get otherUserItems():Map;

        public function get otherUserAccepts():Boolean;

        public function get otherUserCanTrade():Boolean;

        public function dispose():void;

        public function startTrading(k:int, _arg_2:String, _arg_3:Boolean, _arg_4:int, _arg_5:String, _arg_6:Boolean):void;

        public function close():void;

        public function set state(k:uint):void;

        public function getFurniInventoryModel():FurniModel;

        public function getInventory():HabboTabletInventory;

        public function updateItemGroupMaps(k:int, _arg_2:Map, _arg_3:int, _arg_4:Map):void;

        private function populateDataProviders():void;

        public function getOwnItemIdsInTrade():Array;

        public function requestInitialization():void;

        public function subCategorySwitch(k:String):void;

        public function closingInventoryView():void;

        public function startConfirmCountdown():void;

        public function cancelConfirmCountdown():void;

        public function confirmCountdownReady():void;

        public function getItemImage(k:FurnitureItem):BitmapData;

        public function imageReady(k:int, _arg_2:BitmapData):void;

        public function imageFailed(k:int):void;

        public function handleMessageEvent(k:IMessageEvent):void;

        public function requestOpenTrading(k:int, _arg_2:int):void;

        public function requestAddItemToTrading(k:int, _arg_2:int, _arg_3:int, _arg_4:Boolean, _arg_5:IStuffData):Boolean;

        public function requestRemoveItemFromTrading(k:int):void;

        public function requestAcceptTrading():void;

        public function requestUnacceptTrading():void;

        public function requestConfirmAcceptTrading():void;

        public function requestConfirmDeclineTrading():void;

        public function requestCancelTrading():void;

        private function get citizenshipTalentTrackEnabled():Boolean;

        public function updateView():void;

        public function selectItemById(k:String):void;

        public function get ownDataProvider():ListCollection;

        public function get otherDataProvider():ListCollection;

        public function get cancelReason():int;

        public function startPendingTrade(k:int):void;


    }
}//package com.sulake.habbo.tablet.inventory.trading

