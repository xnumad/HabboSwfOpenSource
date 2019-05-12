package com.sulake.core.window
{
    import flash.utils.Dictionary;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.core.window.components.ActivatorController;
    import com.sulake.core.window.components.BackgroundController;
    import com.sulake.core.window.components.BorderController;
    import com.sulake.core.window.components.BoxSizerController;
    import com.sulake.core.window.components.BubbleController;
    import com.sulake.core.window.components.ButtonController;
    import com.sulake.core.window.components.ButtonGroupController;
    import com.sulake.core.window.components.BitmapWrapperController;
    import com.sulake.core.window.components.CheckboxController;
    import com.sulake.core.window.components.ContainerController;
    import com.sulake.core.window.components.ContainerButtonController;
    import com.sulake.core.window.components.CloseButtonController;
    import com.sulake.core.window.components.DisplayObjectWrapperController;
    import com.sulake.core.window.components.DragBarController;
    import com.sulake.core.window.components.DropMenuController;
    import com.sulake.core.window.components.DropMenuItemController;
    import com.sulake.core.window.components.DropListController;
    import com.sulake.core.window.components.DropListItemController;
    import com.sulake.core.window.components.FormattedTextController;
    import com.sulake.core.window.components.FrameController;
    import com.sulake.core.window.components.HeaderController;
    import com.sulake.core.window.components.HTMLTextController;
    import com.sulake.core.window.components.IconController;
    import com.sulake.core.window.components.ItemListController;
    import com.sulake.core.window.components.ItemGridController;
    import com.sulake.core.window.components.TextLabelController;
    import com.sulake.core.window.components.TextLinkController;
    import com.sulake.core.window.components.PasswordFieldController;
    import com.sulake.core.window.components.RadioButtonController;
    import com.sulake.core.window.components.RegionController;
    import com.sulake.core.window.components.ScalerController;
    import com.sulake.core.window.components.ScrollBarController;
    import com.sulake.core.window.components.ScrollableItemListWindow;
    import com.sulake.core.window.components.ScrollableItemGridWindow;
    import com.sulake.core.window.components.SelectorController;
    import com.sulake.core.window.components.SelectorListController;
    import com.sulake.core.window.components.StaticBitmapController;
    import com.sulake.core.window.components.TabButtonController;
    import com.sulake.core.window.components.TabContainerController;
    import com.sulake.core.window.components.TabContextController;
    import com.sulake.core.window.components.TextController;
    import com.sulake.core.window.components.TextFieldController;
    import com.sulake.core.window.components.TooltipController;
    import com.sulake.core.window.components.WidgetController;
    import com.sulake.core.window.components.*;

    public class Classes 
    {
        protected static var _Str_2474:Dictionary;


        public static function init():void
        {
            if (!_Str_2474)
            {
                _Str_2474 = new Dictionary();
                _Str_2474[WindowType.WINDOW_TYPE_NULL] = WindowController;
                _Str_2474[WindowType.WINDOW_TYPE_ACTIVATOR] = ActivatorController;
                _Str_2474[WindowType.WINDOW_TYPE_BACKGROUND] = BackgroundController;
                _Str_2474[WindowType.WINDOW_TYPE_BORDER] = BorderController;
                _Str_2474[WindowType.WINDOW_TYPE_BOXSIZER] = BoxSizerController;
                _Str_2474[WindowType.WINDOW_TYPE_BUBBLE] = BubbleController;
                _Str_2474[WindowType.WINDOW_TYPE_BUBBLE_POINTER_UP] = WindowController;
                _Str_2474[WindowType.WINDOW_TYPE_BUBBLE_POINTER_RIGHT] = WindowController;
                _Str_2474[WindowType.WINDOW_TYPE_BUBBLE_POINTER_DOWN] = WindowController;
                _Str_2474[WindowType.WINDOW_TYPE_BUBBLE_POINTER_LEFT] = WindowController;
                _Str_2474[WindowType.WINDOW_TYPE_BUTTON] = ButtonController;
                _Str_2474[WindowType.WINDOW_TYPE_BUTTON_THICK] = ButtonController;
                _Str_2474[WindowType.WINDOW_TYPE_BUTTON_GROUP_LEFT] = ButtonGroupController;
                _Str_2474[WindowType.WINDOW_TYPE_BUTTON_GROUP_CENTER] = ButtonGroupController;
                _Str_2474[WindowType.WINDOW_TYPE_BUTTON_GROUP_RIGHT] = ButtonGroupController;
                _Str_2474[WindowType.WINDOW_TYPE_BITMAP_WRAPPER] = BitmapWrapperController;
                _Str_2474[WindowType.WINDOW_TYPE_CHECKBOX] = CheckboxController;
                _Str_2474[WindowType.WINDOW_TYPE_CONTAINER] = ContainerController;
                _Str_2474[WindowType.WINDOW_TYPE_CONTAINER_BUTTON] = ContainerButtonController;
                _Str_2474[WindowType.WINDOW_TYPE_CLOSEBUTTON] = CloseButtonController;
                _Str_2474[WindowType.WINDOW_TYPE_DISPLAY_OBJECT_WRAPPER] = DisplayObjectWrapperController;
                _Str_2474[WindowType.WINDOW_TYPE_DRAGBAR] = DragBarController;
                _Str_2474[WindowType.WINDOW_TYPE_DROPMENU] = DropMenuController;
                _Str_2474[WindowType.WINDOW_TYPE_DROPMENU_ITEM] = DropMenuItemController;
                _Str_2474[WindowType.WINDOW_TYPE_DROPLIST] = DropListController;
                _Str_2474[WindowType.WINDOW_TYPE_DROPLIST_ITEM] = DropListItemController;
                _Str_2474[WindowType.WINDOW_TYPE_FORMATTED_TEXT] = FormattedTextController;
                _Str_2474[WindowType.WINDOW_TYPE_FRAME] = FrameController;
                _Str_2474[WindowType.WINDOW_TYPE_HEADER] = HeaderController;
                _Str_2474[WindowType.WINDOW_TYPE_HTML] = HTMLTextController;
                _Str_2474[WindowType.WINDOW_TYPE_ICON] = IconController;
                _Str_2474[WindowType.WINDOW_TYPE_ITEMLIST] = ItemListController;
                _Str_2474[WindowType.WINDOW_TYPE_ITEMLIST_HORIZONTAL] = ItemListController;
                _Str_2474[WindowType.WINDOW_TYPE_ITEMLIST_VERTICAL] = ItemListController;
                _Str_2474[WindowType.WINDOW_TYPE_ITEMGRID] = ItemGridController;
                _Str_2474[WindowType.WINDOW_TYPE_ITEMGRID_HORIZONTAL] = ItemGridController;
                _Str_2474[WindowType.WINDOW_TYPE_ITEMGRID_VERTICAL] = ItemGridController;
                _Str_2474[WindowType.WINDOW_TYPE_LABEL] = TextLabelController;
                _Str_2474[WindowType.WINDOW_TYPE_LINK] = TextLinkController;
                _Str_2474[WindowType.WINDOW_TYPE_PASSWORD] = PasswordFieldController;
                _Str_2474[WindowType.WINDOW_TYPE_RADIOBUTTON] = RadioButtonController;
                _Str_2474[WindowType.WINDOW_TYPE_REGION] = RegionController;
                _Str_2474[WindowType.WINDOW_TYPE_SCALER] = ScalerController;
                _Str_2474[WindowType.WINDOW_TYPE_SCROLLBAR_HORIZONTAL] = ScrollBarController;
                _Str_2474[WindowType.WINDOW_TYPE_SCROLLBAR_VERTICAL] = ScrollBarController;
                _Str_2474[WindowType.WINDOW_TYPE_SCROLLBAR_SLIDER_BUTTON_UP] = ButtonController;
                _Str_2474[WindowType.WINDOW_TYPE_SCROLLBAR_SLIDER_BUTTON_DOWN] = ButtonController;
                _Str_2474[WindowType.WINDOW_TYPE_SCROLLBAR_SLIDER_BUTTON_LEFT] = ButtonController;
                _Str_2474[WindowType.WINDOW_TYPE_SCROLLBAR_SLIDER_BUTTON_RIGHT] = ButtonController;
                _Str_2474[WindowType.WINDOW_TYPE_SCROLLBAR_SLIDER_BAR_HORIZONTAL] = DragBarController;
                _Str_2474[WindowType.WINDOW_TYPE_SCROLLBAR_SLIDER_BAR_VERTICAL] = DragBarController;
                _Str_2474[WindowType.WINDOW_TYPE_SCROLLBAR_SLIDER_TRACK_HORIZONTAL] = WindowController;
                _Str_2474[WindowType.WINDOW_TYPE_SCROLLBAR_SLIDER_TRACK_VERTICAL] = WindowController;
                _Str_2474[WindowType.WINDOW_TYPE_SCROLLABLE_ITEMLIST_VERTICAL] = ScrollableItemListWindow;
                _Str_2474[WindowType.WINDOW_TYPE_SCROLLABLE_ITEMGRID_VERTICAL] = ScrollableItemGridWindow;
                _Str_2474[WindowType.WINDOW_TYPE_SELECTOR] = SelectorController;
                _Str_2474[WindowType.WINDOW_TYPE_SELECTOR_LIST] = SelectorListController;
                _Str_2474[WindowType.WINDOW_TYPE_STATIC_BITMAP_WRAPPER] = StaticBitmapController;
                _Str_2474[WindowType.WINDOW_TYPE_TAB_BUTTON] = TabButtonController;
                _Str_2474[WindowType.WINDOW_TYPE_TAB_CONTAINER_BUTTON] = TabContainerController;
                _Str_2474[WindowType.WINDOW_TYPE_TAB_CONTENT] = ContainerController;
                _Str_2474[WindowType.WINDOW_TYPE_TAB_CONTEXT] = TabContextController;
                _Str_2474[WindowType.WINDOW_TYPE_TAB_SELECTOR] = SelectorListController;
                _Str_2474[WindowType.WINDOW_TYPE_TEXT] = TextController;
                _Str_2474[WindowType.WINDOW_TYPE_TEXTFIELD] = TextFieldController;
                _Str_2474[WindowType.WINDOW_TYPE_TOOLTIP] = TooltipController;
                _Str_2474[WindowType.WINDOW_TYPE_WIDGET] = WidgetController;
            }
        }

        public static function _Str_23901(k:uint):Class
        {
            return _Str_2474[k];
        }
    }
}
