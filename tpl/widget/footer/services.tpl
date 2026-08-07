[{block name="footer_services"}]
    <ul class="services list-unstyled">
        [{block name="footer_services_items"}]
            <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=contact"}]">[{oxmultilang ident="CONTACT"}]</a></li>
            [{if $oViewConf->getViewThemeParam('blFooterShowHelp')}]
                <li><a href="[{$oViewConf->getHelpPageLink()}]">[{oxmultilang ident="HELP"}]</a></li>
            [{/if}]
            [{if $oViewConf->getViewThemeParam('blFooterShowLinks')}]
                <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=links"}]">[{oxmultilang ident="LINKS"}]</a></li>
            [{/if}]
            [{if $oView->isActive('Invitations')}]
                <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=invite"}]">[{oxmultilang ident="INVITE_YOUR_FRIENDS"}]</a></li>
            [{/if}]
            [{oxhasrights ident="TOBASKET"}]
                [{block name="footer_services_cart"}]
                    <li>
                        <a href="[{oxgetseourl ident=$oViewConf->getBasketLink()}]">
                            [{oxmultilang ident="CART"}]
                        </a>
                        [{if $oxcmp_basket && $oxcmp_basket->getItemsCount() > 0}] <span class="badge">[{$oxcmp_basket->getItemsCount()}]</span>[{/if}]
                    </li>
                [{/block}]
            [{/oxhasrights}]
            <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account"}]">[{oxmultilang ident="ACCOUNT"}]</a></li>
            [{if $oViewConf->getRevocationLinkVisible()}]
                [{block name="o3_footer_revocation"}]
                    <li><a href="[{$oViewConf->getSelfLink()}]cl=revocation" rel="nofollow">[{oxmultilang ident="O3_REVOCATION_FOOTER_LINK"}]</a></li>
                [{/block}]
            [{/if}]
            [{block name="o3_footer_guarantee_notice"}]
                [{if method_exists($oViewConf, 'getGuaranteeNoticeUrl') && $oViewConf->getGuaranteeNoticeUrl()}]
                    [{* The notice artwork must be visible without any interaction - no click-to-reveal. *}]
                    <li class="footer__guarantee-rights o3-guarantee-rights">
                        <div class="o3-guarantee-rights__title">[{oxmultilang ident="O3_GUARANTEE_RIGHTS_LINK"}]</div>
                        [{include file="layout/inc/guaranteenotice.tpl"}]
                    </li>
                [{/if}]
            [{/block}]
            <li>
                <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_noticelist"}]">
                    [{oxmultilang ident="WISH_LIST"}]
                </a>
                [{if $oxcmp_user && $oxcmp_user->getNoticeListArtCnt()}] <span class="badge">[{$oxcmp_user->getNoticeListArtCnt()}]</span>[{/if}]
            </li>
            [{if $oViewConf->getShowWishlist()}]
                <li>
                    <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_wishlist"}]">
                        [{oxmultilang ident="MY_GIFT_REGISTRY"}]
                    </a>
                    [{if $oxcmp_user && $oxcmp_user->getWishListArtCnt()}] <span class="badge">[{$oxcmp_user->getWishListArtCnt()}]</span>[{/if}]
                </li>
                <li>
                    <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=wishlist" params="wishid="|cat:$oView->getWishlistUserId()}]">
                        [{oxmultilang ident="PUBLIC_GIFT_REGISTRIES"}]
                    </a>
                </li>
            [{/if}]
            [{if $oView->isEnabledDownloadableFiles()}]
                <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_downloads"}]">[{oxmultilang ident="MY_DOWNLOADS"}]</a></li>
            [{/if}]
        [{/block}]
    </ul>
[{/block}]