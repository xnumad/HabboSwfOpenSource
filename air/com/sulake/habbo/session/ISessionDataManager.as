//com.sulake.habbo.session.ISessionDataManager

package com.sulake.habbo.session{
    import com.sulake.core.runtime.IUnknown;
    import flash.events.IEventDispatcher;
    import flash.display.BitmapData;
    import com.sulake.habbo.session.product.IProductData;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.session.product.IProductDataListener;
    import com.sulake.habbo.session.furniture.IFurniDataListener;
    import __AS3__.vec.Vector;
    import flash.utils.Dictionary;

    public /*dynamic*/ interface ISessionDataManager extends IUnknown {

        function get events():IEventDispatcher;
        function get systemOpen():Boolean;
        function get systemShutDown():Boolean;
        function hasSecurity(k:int):Boolean;
        function get clubLevel():int;
        function get isRealNoob():Boolean;
        function get userId():int;
        function get userName():String;
        function get realName():String;
        function get figure():String;
        function get gender():String;
        function get nameChangeAllowed():Boolean;
        function get isAnyRoomController():Boolean;
        function get mysteryBoxColor():String;
        function get mysteryKeyColor():String;
        function getUserTags(k:int):Array;
        function getBadgeImage(k:String):BitmapData;
        function getBadgeSmallImage(k:String):BitmapData;
        function getBadgeImageAssetName(k:String):String;
        function getBadgeImageSmallAssetName(k:String):String;
        function requestBadgeImage(k:String):BitmapData;
        function getBadgeImageWithInfo(k:String):BadgeInfo;
        function getGroupBadgeId(k:int):String;
        function getGroupBadgeImage(k:String):BitmapData;
        function getGroupBadgeSmallImage(k:String):BitmapData;
        function getGroupBadgeAssetName(k:String):String;
        function getGroupBadgeSmallAssetName(k:String):String;
        function isAccountSafetyLocked():Boolean;
        function isIgnored(k:String):Boolean;
        function ignoreUser(k:String):void;
        function unignoreUser(k:String):void;
        function get respectLeft():int;
        function get petRespectLeft():int;
        function giveRespect(k:int):void;
        function giveRespectFailed():void;
        function givePetRespect(k:int):void;
        function getProductData(k:String):IProductData;
        function getFloorItemData(k:int):IFurnitureData;
        function getFloorItemsDataByCategory(k:int):Array;
        function getWallItemData(k:int):IFurnitureData;
        function getFloorItemDataByName(k:String, _arg_2:int=0):IFurnitureData;
        function getWallItemDataByName(k:String, _arg_2:int=0):IFurnitureData;
        function openHabboHomePage(k:int):void;
        function pickAllFurniture(k:int):void;
        function ejectAllFurniture(k:int, _arg_2:String):void;
        function ejectPets(k:int):void;
        function loadProductData(k:IProductDataListener=null):Boolean;
        function getFurniData(k:IFurniDataListener):Vector.<IFurnitureData>;
        function addProductsReadyEventListener(k:IProductDataListener):void;
        function isPerkAllowed(k:String):Boolean;
        function getPerkErrorMessage(k:String):String;
        function sendSpecialCommandMessage(k:String):void;
        function get currentTalentTrack():String;
        function removeFurniDataListener(k:IFurniDataListener):void;
        function get accounts():Dictionary;
        function setGodMode(k:Boolean):void;
        function isGodMode():Boolean;

    }
}//package com.sulake.habbo.session

