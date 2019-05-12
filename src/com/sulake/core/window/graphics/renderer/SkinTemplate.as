package com.sulake.core.window.graphics.renderer
{
    import com.sulake.core.window.utils.ChildEntityArray;
    import com.sulake.core.assets.IAsset;

    public class SkinTemplate extends ChildEntityArray implements ISkinTemplate 
    {
        protected var _name:String;
        protected var _asset:IAsset;

        public function SkinTemplate(name:String, asset:IAsset)
        {
            this._name = name;
            this._asset = asset;
        }

        public function get id():uint
        {
            return 0;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get asset():IAsset
        {
            return this._asset;
        }

        public function dispose():void
        {
            var _local_2:uint;
            var k:uint = this.numChildren;
            _local_2 = 0;
            while (_local_2 < k)
            {
                this.removeChildAt(0);
                _local_2++;
            }
            this._asset = null;
            this._name = null;
        }
    }
}
