//com.sulake.habbo.room.object.visualization.furniture.FurnitureParticleSystem

package com.sulake.habbo.room.object.visualization.furniture{
    import com.sulake.core.utils.Map;
    import flash.display.BitmapData;
    import com.sulake.room.object.visualization.IRoomObjectSprite;
    import flash.geom.ColorTransform;
    import flash.geom.Matrix;

    public class FurnitureParticleSystem {

        private var _disposed:Boolean;
        private var _emitters:Map;
        private var _visualization:AnimatedFurnitureVisualization;
        private var _size:int;
        private var _canvasId:int;
        private var _offsetY:int;
        private var _currentEmitter:FurnitureParticleSystemEmitter;
        private var _canvas:BitmapData;
        private var _roomSprite:IRoomObjectSprite;
        private var _hasIgnited:Boolean;
        private var _centerX:int;
        private var _centerY:int;
        private var _scaleMultiplier:Number;
        private var _blackOverlay:BitmapData;
        private var _blackOverlayAlphaTransform:ColorTransform;
        private var _particleColorTransform:ColorTransform;
        private var _identityMatrix:Matrix;
        private var _translationMatrix:Matrix;
        private var _blend:Number;
        private var _bgColor:uint;

        public function FurnitureParticleSystem(k:AnimatedFurnitureVisualization);

        public function dispose():void;

        public function reset():void;

        public function setAnimation(k:int):void;

        private function updateCanvas():void;

        public function getSpriteYOffset(k:int, _arg_2:int, _arg_3:int):int;

        public function controlsSprite(k:int):Boolean;

        public function updateSprites():void;

        public function updateAnimation():void;

        public function parseData(k:XML):void;

        public function copyStateFrom(k:FurnitureParticleSystem):void;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

