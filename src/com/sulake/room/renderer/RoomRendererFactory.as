package com.sulake.room.renderer
{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.runtime.IContext;

    public class RoomRendererFactory extends Component implements IRoomRendererFactory 
    {
        public function RoomRendererFactory(k:IContext, _arg_2:uint=0)
        {
            super(k, _arg_2);
        }

        public function _Str_19555():IRoomRenderer
        {
            var k:RoomRenderer = new RoomRenderer(this);
            return k;
        }
    }
}
