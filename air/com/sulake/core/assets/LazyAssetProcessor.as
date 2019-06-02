//com.sulake.core.assets.LazyAssetProcessor

package com.sulake.core.assets{
    import com.sulake.core.runtime.IUpdateReceiver;
    import __AS3__.vec.Vector;

    public class LazyAssetProcessor implements IUpdateReceiver {

        private var _queue:Vector.<ILazyAsset>;
        private var _running:Boolean;
        private var _disposed:Boolean;

        public function LazyAssetProcessor();

        public function get disposed():Boolean;

        public function dispose():void;

        public function push(k:ILazyAsset):void;

        public function flush():void;

        public function update(k:uint):void;


    }
}//package com.sulake.core.assets

