package com.sulake.habbo.freeflowchat.viewer.simulation
{
    import com.sulake.habbo.freeflowchat.viewer.visualization.style.IChatStyleInternal;
    import flash.display.Sprite;
    import flash.text.TextFormat;
    import flash.text.StyleSheet;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import flash.geom.Rectangle;

    public class BlankStyle implements IChatStyleInternal 
    {
        public function getNewBackgroundSprite(k:uint=0xFFFFFF):Sprite
        {
            var _local_2:Sprite = new Sprite();
            _local_2.graphics.clear();
            _local_2.graphics.beginFill(0, 0);
            _local_2.graphics.drawRect(0, 0, 20, (ChatFlowStage._Str_7698 + ChatBubbleSimulationEntity._Str_13872));
            _local_2.graphics.endFill();
            return _local_2;
        }

        public function get textFormat():TextFormat
        {
            return new TextFormat();
        }

        public function get styleSheet():StyleSheet
        {
            return null;
        }

        public function get pointer():BitmapData
        {
            return new BitmapData(1, 10, true, 0);
        }

        public function get _Str_8470():int
        {
            return ChatFlowStage._Str_7698;
        }

        public function get _Str_5505():Point
        {
            return null;
        }

        public function get _Str_4931():Boolean
        {
            return true;
        }

        public function get isSystemStyle():Boolean
        {
            return true;
        }

        public function get textFieldMargins():Rectangle
        {
            return new Rectangle(0, 0, 0, 0);
        }

        public function get overlap():Rectangle
        {
            return new Rectangle(0, 0, 0, 0);
        }

        public function get allowHTML():Boolean
        {
            return false;
        }
    }
}
