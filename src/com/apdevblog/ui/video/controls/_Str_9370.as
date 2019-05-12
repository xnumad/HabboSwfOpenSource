package com.apdevblog.ui.video.controls
{
    import flash.display.Sprite;
    import com.apdevblog.utils._Str_3771;
    import flash.display.Shape;
    import flash.display.Graphics;

    public class _Str_9370 extends Sprite 
    {
        public function _Str_9370()
        {
            mouseEnabled = false;
            mouseChildren = false;
            alpha = 0.3;
            var k:Shape = _Str_3771._Str_25390(28, 40, 360, 0xFFFFFF, 1);
            addChild(k);
            var _local_2:Graphics = graphics;
            _local_2.beginFill(0xFFFFFF, 1);
            _local_2.moveTo(-9, -16);
            _local_2.lineTo(15, 0);
            _local_2.lineTo(-9, 16);
            _local_2.lineTo(-9, -16);
            _local_2.endFill();
        }
    }
}
