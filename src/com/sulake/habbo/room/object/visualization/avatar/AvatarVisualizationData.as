package com.sulake.habbo.room.object.visualization.avatar
{
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.habbo.avatar.IAvatarImage;
    import com.sulake.habbo.avatar.enum.AvatarScaleType;
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import com.sulake.habbo.avatar._Str_936;
    import com.sulake.core.assets.IAsset;

    public class AvatarVisualizationData implements IRoomObjectVisualizationData 
    {
        private var _avatarRenderer:IAvatarRenderManager = null;


        public function get _Str_1458():IAvatarRenderManager
        {
            return this._avatarRenderer;
        }

        public function set _Str_1458(k:IAvatarRenderManager):void
        {
            this._avatarRenderer = k;
        }

        public function initialize(k:XML):Boolean
        {
            return true;
        }

        public function dispose():void
        {
            this._avatarRenderer = null;
        }

        public function _Str_8991(k:String, _arg_2:Number, _arg_3:String=null, _arg_4:IAvatarImageListener=null, _arg_5:_Str_936=null):IAvatarImage
        {
            var _local_6:IAvatarImage;
            if (this._avatarRenderer != null)
            {
                _local_6 = null;
                if (_arg_2 > 48)
                {
                    _local_6 = this._avatarRenderer.createAvatarImage(k, AvatarScaleType.LARGE, _arg_3, _arg_4, _arg_5);
                }
                else
                {
                    _local_6 = this._avatarRenderer.createAvatarImage(k, AvatarScaleType.SMALL, _arg_3, _arg_4, _arg_5);
                }
                return _local_6;
            }
            return null;
        }

        public function getLayerCount(k:String):Number
        {
            return 0;
        }

        public function getAvatarRendererAsset(k:String):IAsset
        {
            if (this._avatarRenderer == null)
            {
                return null;
            }
            return this._avatarRenderer.assets.getAssetByName(k);
        }
    }
}
