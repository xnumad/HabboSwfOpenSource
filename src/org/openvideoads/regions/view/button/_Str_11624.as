package org.openvideoads.regions.view.button
{
    import org.openvideoads.regions.view.RegionView;
    import org.openvideoads.regions.config.CloseButtonConfig;
    import org.openvideoads.util.GraphicsUtils;
    import flash.text.TextField;
    import flash.display.BlendMode;
    import flash.text.TextFieldAutoSize;
    import flash.text.AntiAliasType;

    public class _Str_11624 extends _Str_4474 
    {
        protected var _color:String = "#FFFFFF";

        public function _Str_11624(k:String=null, _arg_2:RegionView=null, _arg_3:CloseButtonConfig=null)
        {
            if (_arg_3 != null)
            {
                this._color = _arg_3.color;
            }
            super(k, _arg_2, 5, 5);
        }

        override protected function drawButton():void
        {
            this.graphics.clear();
            this.graphics.beginFill(0, 0);
            this.graphics.drawCircle(0, 0, 10);
            this.graphics.endFill();
            var k:TextField = GraphicsUtils._Str_20156(false, null, 14, true, GraphicsUtils._Str_23784(this._color));
            k.blendMode = BlendMode.LAYER;
            k.autoSize = TextFieldAutoSize.CENTER;
            k.wordWrap = false;
            k.multiline = false;
            k.antiAliasType = AntiAliasType.ADVANCED;
            k.condenseWhite = true;
            k.mouseEnabled = false;
            k.text = "+";
            k.x = -9;
            k.y = -10;
            k.selectable = false;
            k.mouseEnabled = true;
            this.addChild(k);
        }
    }
}
