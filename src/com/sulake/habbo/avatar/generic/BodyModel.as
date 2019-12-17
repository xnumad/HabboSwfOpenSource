package com.sulake.habbo.avatar.generic
{
    import com.sulake.habbo.avatar.common.CategoryBaseModel;
    import com.sulake.habbo.avatar.common.IAvatarEditorCategoryModel;
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import com.sulake.habbo.avatar.HabboAvatarEditor;
    import com.sulake.habbo.avatar.figuredata.FigureData;
    import com.sulake.habbo.avatar.common.CategoryData;
    import com.sulake.habbo.avatar.common.AvatarEditorGridColorItem;
    import com.sulake.habbo.avatar.common.AvatarEditorGridPartItem;
    import com.sulake.habbo.avatar.IAvatarImage;
    import com.sulake.habbo.avatar.enum.AvatarScaleType;
    import com.sulake.habbo.avatar.enum.AvatarSetType;

    public class BodyModel extends CategoryBaseModel implements IAvatarEditorCategoryModel, IAvatarImageListener 
    {
        private var _imageCallBackHandled:Boolean;

        public function BodyModel(k:HabboAvatarEditor)
        {
            super(k);
        }

        override protected function init():void
        {
            super.init();
            _Str_3130(FigureData.FACE);
            _Str_2367 = true;
            if (!_Str_2271)
            {
                _Str_2271 = new BodyView(this);
                if (_Str_2271)
                {
                    _Str_2271.init();
                }
            }
        }

        override public function switchCategory(k:String=""):void
        {
            _Str_2271.switchCategory(k);
        }

        override public function selectColor(k:String, _arg_2:int, _arg_3:int):void
        {
            var _local_4:CategoryData = _Str_2382[k];
            if (_local_4 == null)
            {
                return;
            }
            _local_4._Str_17959(_arg_2, _arg_3);
            var _local_5:AvatarEditorGridColorItem = _local_4._Str_13355(_arg_3);
            if (_local_5._Str_14863)
            {
                _Str_2278.openHabboClubAdWindow();
                return;
            }
            _Str_2278.figureData.savePartSetColourId(k, _local_4._Str_11211(), true);
            this.updateSelectionsFromFigure(FigureData.FACE);
        }

        override protected function updateSelectionsFromFigure(k:String):void
        {
            var _local_5:AvatarEditorGridPartItem;
            var _local_6:String;
            var _local_7:IAvatarImage;
            if (!_Str_2382)
            {
                return;
            }
            var _local_2:int = _Str_2278.figureData.getPartSetId(FigureData.FACE);
            var _local_3:Array = _Str_2278.figureData.getColourIds(FigureData.FACE);
            var _local_4:CategoryData = _Str_2382[k];
            if (_local_4 == null)
            {
                return;
            }
            _local_4._Str_20245(_local_2);
            _local_4._Str_17669(_local_3);
            for each (_local_5 in _local_4.parts)
            {
                _local_6 = _Str_2278.figureData.getFigureStringWithFace(_local_5.id);
                _local_7 = _Str_2278.manager.avatarRenderManager.createAvatarImage(_local_6, AvatarScaleType.LARGE, null, this);
                _local_5._Str_3093 = _local_7._Str_818(AvatarSetType.HEAD);
                _local_7.dispose();
            }
        }

        public function _Str_840(k:String):void
        {
            if (!this._imageCallBackHandled)
            {
                this._imageCallBackHandled = true;
                this.updateSelectionsFromFigure(FigureData.FACE);
            }
        }
    }
}

