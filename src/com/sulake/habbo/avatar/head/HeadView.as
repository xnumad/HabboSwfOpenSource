package com.sulake.habbo.avatar.head
{
    import com.sulake.habbo.avatar.common.CategoryBaseView;
    import com.sulake.habbo.avatar.common.IAvatarEditorCategoryView;
    import com.sulake.habbo.avatar.common.IAvatarEditorCategoryModel;
    import com.sulake.habbo.avatar.enum.AvatarEditorFigureCategory;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.avatar.figuredata.FigureData;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class HeadView extends CategoryBaseView implements IAvatarEditorCategoryView 
    {
        public function HeadView(k:IAvatarEditorCategoryModel)
        {
            super(k);
        }

        override public function init():void
        {
            if (!window)
            {
                window = (_Str_2307.controller.view.getCategoryContainer(AvatarEditorFigureCategory.HEAD) as IWindowContainer);
                window.visible = false;
                window.procedure = this._Str_3328;
            }
            _Str_2367 = true;
            if (((_Str_2307) && (_Str_2889 == "")))
            {
                _Str_2307.switchCategory(FigureData.HR);
            }
        }

        public function switchCategory(k:String):void
        {
            if (window == null)
            {
                return;
            }
            if (window.disposed)
            {
                return;
            }
            _Str_3905(_Str_2851);
            k = ((k == "") ? _Str_2889 : k);
            switch (k)
            {
                case FigureData.HR:
                    _Str_2851 = "tab_hair";
                    break;
                case FigureData.HA:
                    _Str_2851 = "tab_hat";
                    break;
                case FigureData.HE:
                    _Str_2851 = "tab_accessories";
                    break;
                case FigureData.EA:
                    _Str_2851 = "tab_eyewear";
                    break;
                case FigureData.FA:
                    _Str_2851 = "tab_masks";
                    break;
                default:
                    throw (new Error((('[HeadView] Unknown item category: "' + k) + '"')));
            }
            _Str_2889 = k;
            _Str_3621(_Str_2851);
            if (!_Str_2367)
            {
                this.init();
            }
            updateGridView(k);
        }

        private function _Str_3328(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case "tab_hair":
                        this.switchCategory(FigureData.HR);
                        break;
                    case "tab_hat":
                        this.switchCategory(FigureData.HA);
                        break;
                    case "tab_accessories":
                        this.switchCategory(FigureData.HE);
                        break;
                    case "tab_eyewear":
                        this.switchCategory(FigureData.EA);
                        break;
                    case "tab_masks":
                        this.switchCategory(FigureData.FA);
                        break;
                }
            }
            else
            {
                if (k.type == WindowMouseEvent.OVER)
                {
                    switch (_arg_2.name)
                    {
                        case "tab_hair":
                        case "tab_hat":
                        case "tab_accessories":
                        case "tab_eyewear":
                        case "tab_masks":
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
                            case "tab_hair":
                            case "tab_hat":
                            case "tab_accessories":
                            case "tab_eyewear":
                            case "tab_masks":
                                if (_Str_2851 != _arg_2.name)
                                {
                                    _Str_3905(_arg_2.name);
                                }
                                return;
                        }
                    }
                }
            }
        }
    }
}
