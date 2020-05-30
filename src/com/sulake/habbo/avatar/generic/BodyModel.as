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
            _isInitialized = true;
            if (!_view)
            {
                _view = new BodyView(this);
                if (_view)
                {
                    _view.init();
                }
            }
        }

        override public function switchCategory(k:String=""):void
        {
            _view.switchCategory(k);
        }

        override public function selectColor(k:String, _arg_2:int, _arg_3:int):void
        {
            var _local_4:CategoryData = _categories[k];
            if (_local_4 == null)
            {
                return;
            }
            _local_4._Str_17959(_arg_2, _arg_3);
            var _local_5:AvatarEditorGridColorItem = _local_4.getSelectedColor(_arg_3);
            if (_local_5.isDisabledForWearing)
            {
                _controller.openHabboClubAdWindow();
                return;
            }
            _controller.figureData.savePartSetColourId(k, _local_4.getSelectedColorIds(), true);
            this.updateSelectionsFromFigure(FigureData.FACE);
        }

        override protected function updateSelectionsFromFigure(k:String):void
        {
            var _local_5:AvatarEditorGridPartItem;
            var _local_6:String;
            var _local_7:IAvatarImage;
            if (!_categories)
            {
                return;
            }
            var _local_2:int = _controller.figureData.getPartSetId(FigureData.FACE);
            var _local_3:Array = _controller.figureData.getColourIds(FigureData.FACE);
            var _local_4:CategoryData = _categories[k];
            if (_local_4 == null)
            {
                return;
            }
            _local_4._Str_20245(_local_2);
            _local_4._Str_17669(_local_3);
            for each (_local_5 in _local_4.parts)
            {
                _local_6 = _controller.figureData.getFigureStringWithFace(_local_5.id);
                _local_7 = _controller.manager.avatarRenderManager.createAvatarImage(_local_6, AvatarScaleType.LARGE, null, this);
                _local_5._Str_3093 = _local_7._Str_818(AvatarSetType.HEAD);
                _local_7.dispose();
            }
        }

        public function avatarImageReady(k:String):void
        {
            if (!this._imageCallBackHandled)
            {
                this._imageCallBackHandled = true;
                this.updateSelectionsFromFigure(FigureData.FACE);
            }
        }
    }
}

