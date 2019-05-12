package com.sulake.habbo.avatar.torso
{
    import com.sulake.habbo.avatar.common.CategoryBaseModel;
    import com.sulake.habbo.avatar.common.IAvatarEditorCategoryModel;
    import com.sulake.habbo.avatar.HabboAvatarEditor;
    import com.sulake.habbo.avatar.figuredata.FigureData;

    public class TorsoModel extends CategoryBaseModel implements IAvatarEditorCategoryModel 
    {
        public function TorsoModel(k:HabboAvatarEditor)
        {
            super(k);
        }

        override protected function init():void
        {
            super.init();
            _Str_3130(FigureData.CC);
            _Str_3130(FigureData.CH);
            _Str_3130(FigureData.CHEST_ACCESSORIES);
            _Str_3130(FigureData.CHEST_PRINTS);
            _Str_2367 = true;
            if (!_Str_2271)
            {
                _Str_2271 = new TorsoView(this);
                if (_Str_2271)
                {
                    _Str_2271.init();
                }
            }
        }
    }
}
