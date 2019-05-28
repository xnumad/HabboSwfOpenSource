package com.sulake.habbo.avatar.structure.animation
{
    public class AnimationFrame 
    {
        private var _number:int;
        private var _assetPartDefinition:String;

        public function AnimationFrame(k:XML)
        {
            this._number = parseInt(k.@number);
            this._assetPartDefinition = k.@assetpartdefinition;
        }

        public function get number():int
        {
            return this._number;
        }

        public function get assetPartDefinition():String
        {
            return this._assetPartDefinition;
        }
    }
}
