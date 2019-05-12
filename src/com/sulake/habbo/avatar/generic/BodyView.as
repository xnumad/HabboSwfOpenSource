package com.sulake.habbo.avatar.generic
{
    import com.sulake.habbo.avatar.common.CategoryBaseView;
    import com.sulake.habbo.avatar.common.IAvatarEditorCategoryView;
    import com.sulake.habbo.avatar.figuredata.FigureData;
    import com.sulake.habbo.avatar.common.IAvatarEditorCategoryModel;
    import com.sulake.habbo.avatar.enum.AvatarEditorFigureCategory;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class BodyView extends CategoryBaseView implements IAvatarEditorCategoryView 
    {
        private const TAB_BOY_ID:String = "tab_boy";
        private const TAB_GIRL_ID:String = "tab_girl";

        public function BodyView(k:IAvatarEditorCategoryModel)
        {
            super(k);
            _Str_2889 = FigureData.FACE;
        }

        override public function reset():void
        {
            super.reset();
            _Str_2889 = FigureData.FACE;
        }

        override public function init():void
        {
            if (!window)
            {
                window = (_Str_2307.controller.view.getCategoryContainer(AvatarEditorFigureCategory.GENERIC) as IWindowContainer);
                window.visible = false;
                window.procedure = this.windowEventProc;
            }
            updateGridView(FigureData.FACE);
            _Str_2367 = true;
            this.updateGenderTab();
        }

        override public function getWindowContainer():IWindowContainer
        {
            if (!_Str_2367)
            {
                this.init();
            }
            this.updateGenderTab();
            return window;
        }

        public function updateGenderTab():void
        {
            if (_Str_2307 == null)
            {
                return;
            }
            switch (_Str_2307.controller.gender)
            {
                case FigureData.M:
                    _Str_3621(this.TAB_BOY_ID);
                    _Str_3905(this.TAB_GIRL_ID);
                    return;
                case FigureData.F:
                    _Str_3621(this.TAB_GIRL_ID);
                    _Str_3905(this.TAB_BOY_ID);
                    return;
            }
        }

        public function switchCategory(k:String):void
        {
            this.updateGenderTab();
            updateGridView(((k == "") ? _Str_2889 : k));
        }

        private function windowEventProc(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case this.TAB_BOY_ID:
                        _Str_2307.controller.gender = FigureData.M;
                        k.stopPropagation();
                        break;
                    case this.TAB_GIRL_ID:
                        _Str_2307.controller.gender = FigureData.F;
                        k.stopPropagation();
                        break;
                }
            }
            else
            {
                if (k.type == WindowMouseEvent.OVER)
                {
                    switch (_arg_2.name)
                    {
                        case this.TAB_BOY_ID:
                        case this.TAB_GIRL_ID:
                            _Str_3621(_arg_2.name);
                            break;
                    }
                }
                else
                {
                    if (k.type == WindowMouseEvent.OUT)
                    {
                        switch (_arg_2.name)
                        {
                            case this.TAB_BOY_ID:
                            case this.TAB_GIRL_ID:
                                this.updateGenderTab();
                                return;
                        }
                    }
                }
            }
        }
    }
}
