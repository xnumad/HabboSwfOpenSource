package com.sulake.core.window.graphics.renderer
{
    import com.sulake.core.window.IWindow;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;

    public class FillSkinRenderer extends SkinRenderer 
    {
        public function FillSkinRenderer(k:String)
        {
            super(k);
        }

        override public function draw(k:IWindow, _arg_2:BitmapData, _arg_3:Rectangle, _arg_4:uint, _arg_5:Boolean):void
        {
            _arg_2.fillRect(_arg_3, k.color);
        }
    }
}
