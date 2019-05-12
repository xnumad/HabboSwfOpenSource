package com.sulake.habbo.catalog.viewer
{
    import com.sulake.habbo.catalog.IPurchasableOffer;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.room.IStuffData;

    public class MultiProductContainer extends SingleProductContainer 
    {
        public function MultiProductContainer(k:IPurchasableOffer, _arg_2:Vector.<IProduct>, _arg_3:HabboCatalog)
        {
            super(k, _arg_2, _arg_3);
        }

        override public function initProductIcon(k:IRoomEngine, _arg_2:IStuffData=null):void
        {
            super.initProductIcon(k);
            var _local_3:IWindow = _Str_2271.findChildByName("multiContainer");
            if (_local_3)
            {
                _local_3.visible = true;
            }
            var _local_4:ITextWindow = (_Str_2271.findChildByName("multiCounter") as ITextWindow);
            if (_local_4)
            {
                _local_4.text = ("x" + _Str_6851.productCount);
            }
            this._Str_15497(offer.clubLevel);
        }
    }
}
