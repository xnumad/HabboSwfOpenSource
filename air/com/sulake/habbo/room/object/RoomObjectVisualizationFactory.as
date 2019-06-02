//com.sulake.habbo.room.object.RoomObjectVisualizationFactory

package com.sulake.habbo.room.object{
    import com.sulake.core.runtime.Component;
    import com.sulake.room.object.IRoomObjectVisualizationFactory;
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.core.utils.Map;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import __AS3__.vec.Vector;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.room.object.visualization.IRoomObjectGraphicVisualization;
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;

    public class RoomObjectVisualizationFactory extends Component implements IRoomObjectVisualizationFactory {

        private var _habboAvatar:IAvatarRenderManager;
        private var _visualizationDatas:Map;
        private var _enableCaching:Boolean;

        public function RoomObjectVisualizationFactory(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null);

        override protected function get dependencies():Vector.<ComponentDependency>{
        }
        override public function dispose():void;

        public function createRoomObjectVisualization(k:String):IRoomObjectGraphicVisualization;

        public function getRoomObjectVisualizationData(k:String, _arg_2:String, _arg_3:XML):IRoomObjectVisualizationData;

        public function createGraphicAssetCollection():IGraphicAssetCollection;


    }
}//package com.sulake.habbo.room.object

