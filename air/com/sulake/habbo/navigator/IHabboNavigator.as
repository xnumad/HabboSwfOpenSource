//com.sulake.habbo.navigator.IHabboNavigator

package com.sulake.habbo.navigator{
    import com.sulake.core.runtime.IUnknown;
    import flash.events.IEventDispatcher;
    import flash.geom.Point;
    import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;

    public /*dynamic*/ interface IHabboNavigator extends IUnknown {

        function get events():IEventDispatcher;
        function goToHomeRoom():Boolean;
        function performTagSearch(k:String):void;
        function performTextSearch(k:String):void;
        function performGuildBaseSearch():void;
        function performCompetitionRoomsSearch(k:int, _arg_2:int):void;
        function showOwnRooms():void;
        function goToPrivateRoom(k:int):void;
        function hasRoomRightsButIsNotOwner(k:int):Boolean;
        function removeRoomRights(k:int):void;
        function goToRoomNetwork(k:int, _arg_2:Boolean):void;
        function startRoomCreation():void;
        function openNavigator(k:Point=null):void;
        function closeNavigator():void;
        function get homeRoomId():int;
        function get enteredGuestRoomData():GuestRoomData;
        function showToolbarHover(k:Point):void;
        function hideToolbarHover(k:Boolean):void;
        function toggleRoomInfoVisibility():void;
        function canRateRoom():Boolean;

    }
}//package com.sulake.habbo.navigator

