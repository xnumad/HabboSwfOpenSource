//com.sulake.habbo.avatar.actions.AvatarActionManager

package com.sulake.habbo.avatar.actions{
    import com.sulake.core.assets.IAssetLibrary;
    import flash.utils.Dictionary;
    import __AS3__.vec.Vector;

    public class AvatarActionManager {

        private var _assets:IAssetLibrary;
        private var _actions:Dictionary;
        private var _defaultAction:ActionDefinition;
        private var _filtered:Vector.<ActiveActionData>;
        private var _prevented:Vector.<String>;

        public function AvatarActionManager(k:IAssetLibrary, _arg_2:XML);

        private function parseActionOffsets():void;

        public function getActionDefinition(k:String):ActionDefinition;

        public function getActionDefinitionWithState(k:String):ActionDefinition;

        public function getDefaultAction():ActionDefinition;

        public function getCanvasOffsets(k:Vector.<ActiveActionData>, _arg_2:String, _arg_3:int):Array;

        public function sortActions(k:Vector.<ActiveActionData>):Vector.<ActiveActionData>;

        private function filterActions(k:Vector.<ActiveActionData>):Vector.<ActiveActionData>;

        private function orderByPrecedence(k:IActiveActionData, _arg_2:IActiveActionData):Number;


    }
}//package com.sulake.habbo.avatar.actions

