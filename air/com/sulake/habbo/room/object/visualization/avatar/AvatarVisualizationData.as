//com.sulake.habbo.room.object.visualization.avatar.AvatarVisualizationData

package com.sulake.habbo.room.object.visualization.avatar{
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import com.sulake.habbo.avatar.IAvatarImage;
    import com.sulake.core.assets.IAsset;

    public class AvatarVisualizationData implements IRoomObjectVisualizationData {

        private var _avatarRenderer:IAvatarRenderManager;

        public function AvatarVisualizationData();

        public function get avatarRenderer():IAvatarRenderManager;

        public function set avatarRenderer(k:IAvatarRenderManager):void;

        public function initialize(k:XML):Boolean;

        public function dispose():void;

        public function getAvatar(k:String, _arg_2:Number, _arg_3:String=null, _arg_4:IAvatarImageListener=null, _arg_5:String=null):IAvatarImage;

        public function getLayerCount(k:String):Number;

        public function getAvatarRendererAsset(k:String):IAsset;


    }
}//package com.sulake.habbo.room.object.visualization.avatar

