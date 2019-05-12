package com.sulake.core.window.utils
{
    import com.sulake.core.window.enum.WindowType;
    import flash.utils.Dictionary;

    public class TypeCodeTable extends WindowType 
    {
        public static function fillTables(dict:Dictionary, addTo:Dictionary=null):void
        {
            dict["background"] = WINDOW_TYPE_BACKGROUND;
            dict["bitmap"] = WINDOW_TYPE_BITMAP_WRAPPER;
            dict["border"] = WINDOW_TYPE_BORDER;
            dict["boxsizer"] = WINDOW_TYPE_BOXSIZER;
            dict["border_notify"] = WINDOW_TYPE_BORDER_NOTIFY;
            dict["bubble"] = WINDOW_TYPE_BUBBLE;
            dict["bubble_pointer_up"] = WINDOW_TYPE_BUBBLE_POINTER_UP;
            dict["bubble_pointer_right"] = WINDOW_TYPE_BUBBLE_POINTER_RIGHT;
            dict["bubble_pointer_down"] = WINDOW_TYPE_BUBBLE_POINTER_DOWN;
            dict["bubble_pointer_left"] = WINDOW_TYPE_BUBBLE_POINTER_LEFT;
            dict["button"] = WINDOW_TYPE_BUTTON;
            dict["button_thick"] = WINDOW_TYPE_BUTTON_THICK;
            dict["button_icon"] = WINDOW_TYPE_BUTTON_ICON;
            dict["button_group_left"] = WINDOW_TYPE_BUTTON_GROUP_LEFT;
            dict["button_group_center"] = WINDOW_TYPE_BUTTON_GROUP_CENTER;
            dict["button_group_right"] = WINDOW_TYPE_BUTTON_GROUP_RIGHT;
            dict["checkbox"] = WINDOW_TYPE_CHECKBOX;
            dict["closebutton"] = WINDOW_TYPE_CLOSEBUTTON;
            dict["container"] = WINDOW_TYPE_CONTAINER;
            dict["container_button"] = WINDOW_TYPE_CONTAINER_BUTTON;
            dict["display_object_wrapper"] = WINDOW_TYPE_DISPLAY_OBJECT_WRAPPER;
            dict["dropmenu"] = WINDOW_TYPE_DROPMENU;
            dict["dropmenu_item"] = WINDOW_TYPE_DROPMENU_ITEM;
            dict["droplist"] = WINDOW_TYPE_DROPLIST;
            dict["droplist_item"] = WINDOW_TYPE_DROPLIST_ITEM;
            dict["formatted_text"] = WINDOW_TYPE_FORMATTED_TEXT;
            dict["frame"] = WINDOW_TYPE_FRAME;
            dict["frame_notify"] = WINDOW_TYPE_FRAME_NOTIFY;
            dict["header"] = WINDOW_TYPE_HEADER;
            dict["html"] = WINDOW_TYPE_HTML;
            dict["icon"] = WINDOW_TYPE_ICON;
            dict["itemgrid"] = WINDOW_TYPE_ITEMGRID;
            dict["itemgrid_horizontal"] = WINDOW_TYPE_ITEMGRID_HORIZONTAL;
            dict["itemgrid_vertical"] = WINDOW_TYPE_ITEMGRID_VERTICAL;
            dict["itemlist"] = WINDOW_TYPE_ITEMLIST;
            dict["itemlist_horizontal"] = WINDOW_TYPE_ITEMLIST_HORIZONTAL;
            dict["itemlist_vertical"] = WINDOW_TYPE_ITEMLIST_VERTICAL;
            dict["label"] = WINDOW_TYPE_LABEL;
            dict["maximizebox"] = WINDOW_TYPE_MAXIMIZEBOX;
            dict["menu"] = WINDOW_TYPE_MENU;
            dict["menu_item"] = WINDOW_TYPE_MENU_ITEM;
            dict["submenu"] = WINDOW_TYPE_SUBMENU;
            dict["minimizebox"] = WINDOW_TYPE_MINIMIZEBOX;
            dict["notify"] = WINDOW_TYPE_NOTIFY;
            dict["null"] = WINDOW_TYPE_NULL;
            dict["password"] = WINDOW_TYPE_PASSWORD;
            dict["radiobutton"] = WINDOW_TYPE_RADIOBUTTON;
            dict["region"] = WINDOW_TYPE_REGION;
            dict["restorebox"] = WINDOW_TYPE_RESTOREBOX;
            dict["scaler"] = WINDOW_TYPE_SCALER;
            dict["scaler_horizontal"] = WINDOW_TYPE_SCALER_HORIZONTAL;
            dict["scaler_vertical"] = WINDOW_TYPE_SCALER_VERTICAL;
            dict["scrollbar_horizontal"] = WINDOW_TYPE_SCROLLBAR_HORIZONTAL;
            dict["scrollbar_vertical"] = WINDOW_TYPE_SCROLLBAR_VERTICAL;
            dict["scrollbar_slider_button_up"] = WINDOW_TYPE_SCROLLBAR_SLIDER_BUTTON_UP;
            dict["scrollbar_slider_button_down"] = WINDOW_TYPE_SCROLLBAR_SLIDER_BUTTON_DOWN;
            dict["scrollbar_slider_button_left"] = WINDOW_TYPE_SCROLLBAR_SLIDER_BUTTON_LEFT;
            dict["scrollbar_slider_button_right"] = WINDOW_TYPE_SCROLLBAR_SLIDER_BUTTON_RIGHT;
            dict["scrollbar_slider_bar_horizontal"] = WINDOW_TYPE_SCROLLBAR_SLIDER_BAR_HORIZONTAL;
            dict["scrollbar_slider_bar_vertical"] = WINDOW_TYPE_SCROLLBAR_SLIDER_BAR_VERTICAL;
            dict["scrollbar_slider_track_horizontal"] = WINDOW_TYPE_SCROLLBAR_SLIDER_TRACK_HORIZONTAL;
            dict["scrollbar_slider_track_vertical"] = WINDOW_TYPE_SCROLLBAR_SLIDER_TRACK_VERTICAL;
            dict["scrollable_itemlist"] = WINDOW_TYPE_SCROLLABLE_ITEMLIST;
            dict["scrollable_itemlist_vertical"] = WINDOW_TYPE_SCROLLABLE_ITEMLIST_VERTICAL;
            dict["scrollable_itemgrid_vertical"] = WINDOW_TYPE_SCROLLABLE_ITEMGRID_VERTICAL;
            dict["scrollable_itemlist_horizontal"] = WINDOW_TYPE_SCROLLABLE_ITEMLIST_HORIZONTAL;
            dict["selector"] = WINDOW_TYPE_SELECTOR;
            dict["selector_list"] = WINDOW_TYPE_SELECTOR_LIST;
            dict["static_bitmap"] = WINDOW_TYPE_STATIC_BITMAP_WRAPPER;
            dict["tab_button"] = WINDOW_TYPE_TAB_BUTTON;
            dict["tab_container_button"] = WINDOW_TYPE_TAB_CONTAINER_BUTTON;
            dict["tab_context"] = WINDOW_TYPE_TAB_CONTEXT;
            dict["tab_content"] = WINDOW_TYPE_TAB_CONTENT;
            dict["tab_selector"] = WINDOW_TYPE_TAB_SELECTOR;
            dict["text"] = WINDOW_TYPE_TEXT;
            dict["input"] = WINDOW_TYPE_TEXTFIELD;
            dict["link"] = WINDOW_TYPE_LINK;
            dict["toolbar"] = WINDOW_TYPE_TOOLBAR;
            dict["tooltip"] = WINDOW_TYPE_TOOLTIP;
            dict["widget"] = WINDOW_TYPE_WIDGET;
            if (addTo != null)
            {
                for (var key:String in dict)
                {
                    addTo[dict[key]] = key;
                }
            }
        }
    }
}
