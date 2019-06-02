//com.sulake.habbo.room.object.logic.furniture.FurnitureGroupForumTerminalLogic

package com.sulake.habbo.room.object.logic.furniture{
    public class FurnitureGroupForumTerminalLogic extends FurnitureGuildCustomizedLogic {

        public function FurnitureGroupForumTerminalLogic();

        override protected function openContextMenu():void;

        override protected function updateGuildId(k:String):void;

        override public function useObject():void;

        override public function getEventTypes():Array;


    }
}//package com.sulake.habbo.room.object.logic.furniture

