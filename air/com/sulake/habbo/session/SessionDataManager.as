//com.sulake.habbo.session.SessionDataManager

package com.sulake.habbo.session{
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import flash.utils.Dictionary;
    import com.sulake.habbo.session.product.ProductDataParser;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.session.furniture.FurnitureDataParser;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.session.facebook.FaceBookSession;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import __AS3__.vec.Vector;
    import com.sulake.core.runtime.ComponentDependency;
    import flash.events.Event;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.avatar.FigureUpdateEvent;
    import com.sulake.habbo.communication.messages.incoming.avatar.ChangeUserNameResultMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.mysterybox.MysteryBoxKeysMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.users.UserTagsMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.handshake.IdentityAccountsEvent;
    import com.sulake.habbo.communication.messages.incoming.room.pets.PetRespectFailedEvent;
    import com.sulake.habbo.communication.messages.incoming.users.AccountSafetyLockStatusChangeMessageEvent;
    import flash.display.BitmapData;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.habbo.session.product.IProductData;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.session.product.IProductDataListener;
    import com.sulake.habbo.session.furniture.IFurniDataListener;

    public class SessionDataManager extends Component implements ISessionDataManager {

        public static const SETUP_WITHOUT_COMMUNICATION:uint;

        private var _communication:IHabboCommunicationManager;
        private var _perkManager:PerkManager;
        private var _id:int;
        private var _name:String;
        private var _figure:String;
        private var _gender:String;
        private var _realName:String;
        private var _respectTotal:int;
        private var _respectLeft:int;
        private var _petRespectLeft:int;
        private var _nameChangeAllowed:Boolean;
        private var _rights:Array;
        private var _systemOpen:Boolean;
        private var _systemShutDown:Boolean;
        private var _products:Dictionary;
        private var _productParser:ProductDataParser;
        private var _floorItems:Map;
        private var _wallItems:Map;
        private var _furnitureIds:Map;
        private var _furnitureParser:FurnitureDataParser;
        private var _userTagManager:UserTagManager;
        private var _badgeImageManager:BadgeImageManager;
        private var _habboGroupInfoManager:HabboGroupInfoManager;
        private var _ignoredUsersManager:IgnoredUsersManager;
        private var _localization:IHabboLocalizationManager;
        private var _productDataReady:Boolean;
        private var _productDataListeners:Array;
        private var _furniDataListeners:Array;
        private var _clubLevel:int;
        private var _securityLevel:int;
        private var _noobnessLevel:int;
        private var _facebookSession:FaceBookSession;
        private var _accountSafetyLocked:Boolean;
        private var _mysteryBoxColor:String;
        private var _mysteryKeyColor:String;
        private var _isGodMode:Boolean;
        private var _accounts:Dictionary;

        public function SessionDataManager(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null);

        override protected function get dependencies():Vector.<ComponentDependency>{
        }
        private function onConfigurationComplete(k:Event):void;

        override protected function initComponent():void;

        override public function dispose():void;

        private function initBadgeImageManager():void;

        private function initFurnitureData():void;

        private function initProductData():void;

        private function onFurnitureReady(k:Event=null):void;

        private function onUserRights(k:IMessageEvent):void;

        private function onUserObject(k:IMessageEvent):void;

        private function onFigureUpdated(k:FigureUpdateEvent):void;

        private function onUserChange(k:IMessageEvent):void;

        private function onUserNameChange(k:IMessageEvent):void;

        private function onChangeUserNameResult(k:ChangeUserNameResultMessageEvent):void;

        private function onMysteryBoxKeys(k:MysteryBoxKeysMessageEvent):void;

        private function onUserTags(k:UserTagsMessageEvent):void;

        private function onIdentityAccounts(k:IdentityAccountsEvent):void;

        private function onAvailabilityStatus(k:IMessageEvent):void;

        private function onPetRespectFailed(k:PetRespectFailedEvent):void;

        private function onAccountSafetyLockStatusChanged(k:AccountSafetyLockStatusChangeMessageEvent):void;

        public function get systemOpen():Boolean;

        public function get systemShutDown():Boolean;

        public function hasSecurity(k:int):Boolean;

        public function get clubLevel():int;

        public function get isRealNoob():Boolean;

        public function get userId():int;

        public function get userName():String;

        public function get realName():String;

        public function get figure():String;

        public function get isAnyRoomController():Boolean;

        public function getUserTags(k:int):Array;

        public function getBadgeImage(k:String):BitmapData;

        public function getBadgeSmallImage(k:String):BitmapData;

        public function getBadgeImageAssetName(k:String):String;

        public function getBadgeImageSmallAssetName(k:String):String;

        public function requestBadgeImage(k:String):BitmapData;

        public function getBadgeImageWithInfo(k:String):BadgeInfo;

        public function getGroupBadgeId(k:int):String;

        public function send(k:IMessageComposer):void;

        public function getGroupBadgeImage(k:String):BitmapData;

        public function getGroupBadgeSmallImage(k:String):BitmapData;

        public function getGroupBadgeAssetName(k:String):String;

        public function getGroupBadgeSmallAssetName(k:String):String;

        public function isAccountSafetyLocked():Boolean;

        public function get communication():IHabboCommunicationManager;

        public function isIgnored(k:String):Boolean;

        public function ignoreUser(k:String):void;

        public function unignoreUser(k:String):void;

        public function get respectLeft():int;

        public function get petRespectLeft():int;

        public function giveRespect(k:int):void;

        public function giveRespectFailed():void;

        public function givePetRespect(k:int):void;

        public function getProductData(k:String):IProductData;

        public function getFloorItemData(k:int):IFurnitureData;

        public function getFloorItemsDataByCategory(k:int):Array;

        public function getWallItemData(k:int):IFurnitureData;

        public function getFloorItemDataByName(k:String, _arg_2:int=0):IFurnitureData;

        public function getWallItemDataByName(k:String, _arg_2:int=0):IFurnitureData;

        public function openHabboHomePage(k:int):void;

        public function loadProductData(k:IProductDataListener=null):Boolean;

        public function addProductsReadyEventListener(k:IProductDataListener):void;

        private function onProductsReady(k:Event):void;

        private function onRoomReady(k:IMessageEvent):void;

        public function sendSpecialCommandMessage(k:String):void;

        public function get gender():String;

        private function onCatalogPublished(k:IMessageEvent):void;

        public function removeFurniDataListener(k:IFurniDataListener):void;

        public function getFurniData(k:IFurniDataListener):Vector.<IFurnitureData>;

        public function get localization():IHabboLocalizationManager;

        public function get nameChangeAllowed():Boolean;

        public function isPerkAllowed(k:String):Boolean;

        public function getPerkErrorMessage(k:String):String;

        public function get currentTalentTrack():String;

        public function get mysteryBoxColor():String;

        public function get mysteryKeyColor():String;

        public function get accounts():Dictionary;

        public function setGodMode(k:Boolean):void;

        public function isGodMode():Boolean;

        public function pickAllFurniture(k:int):void;

        public function ejectAllFurniture(k:int, _arg_2:String):void;

        public function ejectPets(k:int):void;


    }
}//package com.sulake.habbo.session

