package org.openvideoads.regions.view.button
{
    import flash.display.Loader;
    import flash.net.URLRequest;
    import org.openvideoads.regions.view.RegionView;
    import org.openvideoads.regions.config.CloseButtonConfig;

    public class _Str_9873 extends _Str_4474 
    {
        public function _Str_9873(k:String=null, _arg_2:RegionView=null, _arg_3:CloseButtonConfig=null)
        {
            var _local_4:Loader;
            var _local_5:URLRequest;
            super(k, _arg_2, _arg_3.width, _arg_3.height);
            if (_arg_3 != null)
            {
                _local_4 = new Loader();
                _local_5 = new URLRequest(_arg_3.imageURL);
                _local_4.load(_local_5);
                addChild(_local_4);
                _local_4.x = 0;
                _local_4.y = 0;
            }
        }

        override public function calculateLayoutPosition(k:int, _arg_2:int):void
        {
            x = ((k - _Str_17906) - (_arg_2 / 5));
            y = ((_arg_2 > 0) ? (0 + (_arg_2 / 5)) : 0);
        }
    }
}
