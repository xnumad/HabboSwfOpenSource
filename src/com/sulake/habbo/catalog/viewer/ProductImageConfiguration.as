package com.sulake.habbo.catalog.viewer
{
    import flash.utils.Dictionary;

    public class ProductImageConfiguration 
    {
        public static const PRODUCT_IMAGES:Dictionary = new Dictionary();

        {
            PRODUCT_IMAGES["deal01"] = "ctlg_pic_deal01";
            PRODUCT_IMAGES["deal02"] = "ctlg_pic_deal02";
            PRODUCT_IMAGES["deal03"] = "ctlg_pic_deal03";
            PRODUCT_IMAGES["deal04"] = "ctlg_pic_deal04";
            PRODUCT_IMAGES["deal05"] = "ctlg_pic_deal05";
            PRODUCT_IMAGES["deal06"] = "ctlg_pic_deal06";
            PRODUCT_IMAGES["deal07"] = "ctlg_pic_deal07";
            PRODUCT_IMAGES["deal08"] = "ctlg_pic_deal08";
            PRODUCT_IMAGES["deal09"] = "ctlg_pic_deal09";
            PRODUCT_IMAGES["deal10"] = "ctlg_pic_deal10";
            PRODUCT_IMAGES["deal97"] = "ctlg_pic_deal97";
            PRODUCT_IMAGES["deal98"] = "ctlg_pic_deal98";
            PRODUCT_IMAGES["deal99"] = "ctlg_pic_deal99";
            PRODUCT_IMAGES["noob_set_1"] = "ctlg_pic_noob_set_1";
            PRODUCT_IMAGES["noob_set_2"] = "ctlg_pic_noob_set_2";
            PRODUCT_IMAGES["noob_set_3"] = "ctlg_pic_noob_set_3";
            PRODUCT_IMAGES["noob_set_4"] = "ctlg_pic_noob_set_4";
            PRODUCT_IMAGES["noob_set_5"] = "ctlg_pic_noob_set_5";
            PRODUCT_IMAGES["noob_set_6"] = "ctlg_pic_noob_set_6";
            PRODUCT_IMAGES["a0 deal100"] = "ctlg_pic_a0_deal100";
            PRODUCT_IMAGES["a0 raredaffodilrug"] = "ctlg_pic_a0_raredaffodilrug";
            PRODUCT_IMAGES["a2 slp"] = "ctlg_pic_a2_slp";
            PRODUCT_IMAGES["A2 tlp 20"] = "ctlg_pic_A2_tlp_20";
            PRODUCT_IMAGES["DEAL_HC_1"] = "ctlg_pic_hc_deal01";
            PRODUCT_IMAGES["DEAL_HC_2"] = "ctlg_pic_hc_deal02";
            PRODUCT_IMAGES["DEAL_HC_3"] = "ctlg_pic_hc_deal03";
            PRODUCT_IMAGES["hween09_ghost"] = "ctlg_pic_hween09_ghost";
            PRODUCT_IMAGES["ads_twi_mist"] = "ctlg_pic_ads_twi_mist";
            PRODUCT_IMAGES["party_lights"] = "ctlg_pic_party_lights";
            PRODUCT_IMAGES["xmas_snow"] = "ctlg_pic_xmas_snow";
            PRODUCT_IMAGES["wf_deal1"] = "ctlg_pic_deal_wired_pswdoor";
            PRODUCT_IMAGES["wf_deal2"] = "ctlg_pic_deal_wired_swtchdoor";
            PRODUCT_IMAGES["wf_deal3"] = "ctlg_pic_deal_wired_coopdoor";
            PRODUCT_IMAGES["wf_deal4"] = "ctlg_pic_deal_wired_rmtdoor";
            PRODUCT_IMAGES["wf_deal5"] = "ctlg_pic_deal_wired_wlcmmsg";
            PRODUCT_IMAGES["wf_deal6"] = "ctlg_pic_deal_wired_pswtele";
            PRODUCT_IMAGES["wf_deal7"] = "ctlg_pic_deal_wired_dircntrl";
            PRODUCT_IMAGES["wf_deal8"] = "ctlg_pic_deal_wired_mvngfurni";
            PRODUCT_IMAGES["wf_deal9"] = "ctlg_pic_deal_wired_flshfires";
            PRODUCT_IMAGES["qt_val11_heartlights"] = "ctlg_pic_qt_val11_heartlights";
            PRODUCT_IMAGES["room_ad_plus_badge"] = "events_confirm_purchase";
        }


        public static function hasProductImage(k:String):Boolean
        {
            return !(PRODUCT_IMAGES[k] == null);
        }
    }
}
