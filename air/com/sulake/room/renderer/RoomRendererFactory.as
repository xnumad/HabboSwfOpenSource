//com.sulake.room.renderer.RoomRendererFactory

package com.sulake.room.renderer{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.runtime.IContext;

    public class RoomRendererFactory extends Component implements IRoomRendererFactory {

        public function RoomRendererFactory(k:IContext, _arg_2:uint=0);

        public function createRenderer():IRoomRenderer;


    }
}//package com.sulake.room.renderer

