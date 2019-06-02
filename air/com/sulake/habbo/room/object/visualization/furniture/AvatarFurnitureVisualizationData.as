//com.sulake.habbo.room.object.visualization.furniture.AvatarFurnitureVisualizationData

package com.sulake.habbo.room.object.visualization.furniture{
    import com.sulake.habbo.room.object.visualization.avatar.AvatarVisualizationData;
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import com.sulake.habbo.avatar.IAvatarImage;

    public class AvatarFurnitureVisualizationData extends FurnitureVisualizationData {

        private var _avatarVisualizationData:AvatarVisualizationData;

        public function AvatarFurnitureVisualizationData();

        public function set avatarRenderer(k:IAvatarRenderManager):void;

        override public function dispose():void;

        public function getAvatar(k:String, _arg_2:Number, _arg_3:String=null, _arg_4:IAvatarImageListener=null, _arg_5:String=null):IAvatarImage;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

