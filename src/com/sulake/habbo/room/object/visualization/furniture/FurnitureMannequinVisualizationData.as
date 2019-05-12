package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.habbo.room.object.visualization.avatar.AvatarVisualizationData;
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import com.sulake.habbo.avatar._Str_936;
    import com.sulake.habbo.avatar.IAvatarImage;

    public class FurnitureMannequinVisualizationData extends FurnitureVisualizationData 
    {
        private var _Str_12148:AvatarVisualizationData;

        public function FurnitureMannequinVisualizationData()
        {
            this._Str_12148 = new AvatarVisualizationData();
        }

        public function set _Str_1458(k:IAvatarRenderManager):void
        {
            this._Str_12148._Str_1458 = k;
        }

        override public function dispose():void
        {
            super.dispose();
            this._Str_12148.dispose();
            this._Str_12148 = null;
        }

        public function _Str_8991(k:String, _arg_2:Number, _arg_3:String=null, _arg_4:IAvatarImageListener=null, _arg_5:_Str_936=null):IAvatarImage
        {
            return this._Str_12148._Str_8991(k, _arg_2, _arg_3, _arg_4, _arg_5);
        }
    }
}
