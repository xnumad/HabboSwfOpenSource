//com.sulake.habbo.room.object.visualization.pet.AnimatedPetVisualizationData

package com.sulake.habbo.room.object.visualization.pet{
    import com.sulake.habbo.room.object.visualization.furniture.AnimatedFurnitureVisualizationData;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.room.object.visualization.data.SizeData;

    public class AnimatedPetVisualizationData extends AnimatedFurnitureVisualizationData {

        private var _commonAssets:IAssetLibrary;
        private var _isAllowedToTurnHead:Boolean;

        public function AnimatedPetVisualizationData();

        public function set commonAssets(k:IAssetLibrary):void;

        public function get commonAssets():IAssetLibrary;

        override protected function defineVisualizations(k:XML):Boolean;

        override protected function createSizeData(k:int, _arg_2:int, _arg_3:int):SizeData;

        override protected function processVisualizationElement(k:SizeData, _arg_2:XML):Boolean;

        public function getAnimationForPosture(k:int, _arg_2:String):int;

        public function getGestureDisabled(k:int, _arg_2:String):Boolean;

        public function getAnimationForGesture(k:int, _arg_2:String):int;

        public function getPostureForAnimation(k:int, _arg_2:int):String;

        public function getGestureForAnimation(k:int, _arg_2:int):String;

        public function getPostureCount(k:int):int;

        public function getGestureCount(k:int):int;

        public function get isAllowedToTurnHead():Boolean;


    }
}//package com.sulake.habbo.room.object.visualization.pet

