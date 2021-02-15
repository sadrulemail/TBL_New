// Code By: Ashik Iqbal
// www.ashik.info

$(document).ready(function() {
    jQueryInit();
});

//function pageLoad() {
//    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(jQueryInit);
//}

function pageLoad(sender, args) {
    if (args.get_isPartialLoad()) jQueryInit();
}

function tConfirm(confirmText){
    jConfirm(confirmText, 'Confirmation Dialog', function(r) {
        return r;
    });
    return false;
}

function getReadableFileSizeString(fileSizeInBytes) {
    var i = -1;
    var byteUnits = [' KB', ' MB', ' GB', ' TB', 'PB', 'EB', 'ZB', 'YB'];
    do {
        fileSizeInBytes = fileSizeInBytes / 1024;
        i++;
    } while (fileSizeInBytes > 1024);
    return Math.max(fileSizeInBytes, 0.1).toFixed(2) + byteUnits[i];
}

function jQueryInit() {
    $(document).ready(function () {

        // Prevent the backspace key from navigating back.
        $(document).unbind('keydown').bind('keydown', function (event) {
            var doPrevent = false;
            if (event.keyCode === 8) {
                var d = event.srcElement || event.target;
                if ((d.tagName.toUpperCase() === 'INPUT' && (
                    d.type.toUpperCase() === 'TEXT'
                    || d.type.toUpperCase() === 'PASSWORD'
                    || d.type.toUpperCase() === 'SEARCH')
                    ) || d.tagName.toUpperCase() === 'TEXTAREA') {
                    doPrevent = d.readOnly || d.disabled;
                }
                else {
                    doPrevent = true;
                }
            }
            if (doPrevent) {
                event.preventDefault();
            }
        });

        $("#tabs").tabs({
            cookie: {
                expires: 7
            },
            collapsible: true,
            fx: { opacity: 'toggle'
                , duration: 'fast'
            }
        });
        $('#tabs').attr('display', 'block');
        $("#tabs").show();

        $(".radio").buttonset();

        $(".MainSearchBox").unbind();
        $(".MainSearchBox").autocomplete("Search_CS.ashx", {
            width: 300,
            minChars: 1,
            cacheLength: 10,
            scrollHeight: 500,
            delay: 400,
            scroll: true,
            formatItem: function (data, i, n, value) {
                return "<table><tr><td valign='top'><img src='"
                + value.split(",")[1] + "' width='60' height='60' title='"
                + value.split(",")[2] + "' /></td><td>"
                + value.split(",")[0] + "</td></tr></table>";
            },
            formatResult: function (data, value) {
                return value.split(",")[2];
            }
        });

        $(".emp-add-control-all").autocomplete("Search_EMP_ALL.ashx", {
            width: 300,
            minChars: 1,
            cacheLength: 10,
            scrollHeight: 500,
            delay: 400,
            scroll: true,
            formatItem: function (data, i, n, value) {
                return "<table><tr><td valign='top'><img src='"
                + value.split(",")[1] + "' width='60px' title='"
                + value.split(",")[2] + "' /></td><td>"
                + value.split(",")[0] + "</td></tr></table>";
            },
            formatResult: function (data, value) {
                return value.split(",")[2];
            }
        });

        try {

            $(".MainSearchBox").result(function findValueCallback(event, data, formatted) {
                if (data) {
                    window.open(data[0].split(",")[3], '_blank');
                    return false;
                    //                location = (data[0].split(",")[3]);
                    //                return false;
                }
            });
        }
        catch (e) { }

        //    try {
        //        $('.emp-add-control-all').autocomplete({
        //            source: function (request, response) {
        //                $.getJSON("Search_CS_All.ashx", {
        //                    term: extractLast(request.term)
        //                }, response);
        //            },
        //            search: function () {
        //                // custom minLength
        //                var term = extractLast(this.value);
        //                if (term.length < 2) {
        //                    return false;
        //                }
        //            },
        //            focus: function () {
        //                // prevent value inserted on focus
        //                return false;
        //            },
        //            autoFocus: true,
        //            //response:function( event, ui ) { return false; },
        //            select: function (event, ui) {
        //                $('.emp-add-control-all').val(ui.item.id);

        //                return false;
        //            }
        //        }).data("ui-autocomplete")._renderItem = function (ul, item) {
        //            return $("<li>")
        //        .append("<a title='" + item.id + "'><table><tr><td valign='top'><img src='" + item.img + "' width='50' height='50' /></td><td valign='top'>" + item.result + "</td></tr></table></a>")
        //        .appendTo(ul);
        //        };
        //    } catch (e) { }


        $('.target-blank a').each(function () {
            $(this).attr("target", "_blank");
        });

        //alert('s');
        //$('select').menu();

        $('input:text[Watermark]').each(function () {
            $(this).watermark($(this).attr('Watermark'));
        });


        $('.pictireterms').click(function () {
            $.get('./Profile_Pic_Terms.htm', function (data) {
                $("#dialogue").html(data);
            });
            $("#dialogue").dialog({
                title: 'Profile Picture Instructions...',
                height: 400,
                width: 600,
                modal: true,
                show: "Slow",
                hide: "Slow",
                buttons: {
                    "OK, I am agree": function () {
                        $(this).dialog("close");
                    }
                }
            });
            return false;
        });

        $('.mobile').attr('pattern', '^[\\+]880(1[156789])\\d{8}$').attr('title', 'Bangladesh Mobile No. (+8801xxxxxxxxx)');

        $('.Date').datepicker({
            changeMonth: true,
            changeYear: true,
            showButtonPanel: true,
            dateFormat: 'dd/mm/yy',
            showAnim: 'show'
        });
        //Datepicker Today Problem Resolve
        $.datepicker._gotoToday = function (id) {
            var target = $(id);
            var inst = this._getInst(target[0]);
            if (this._get(inst, 'gotoCurrent') && inst.currentDay) {
                inst.selectedDay = inst.currentDay;
                inst.drawMonth = inst.selectedMonth = inst.currentMonth;
                inst.drawYear = inst.selectedYear = inst.currentYear;
            }
            else {
                var date = new Date();
                inst.selectedDay = date.getDate();
                inst.drawMonth = inst.selectedMonth = date.getMonth();
                inst.drawYear = inst.selectedYear = date.getFullYear();
                this._setDateDatepicker(target, date);
                this._selectDate(id, this._getDateDatepicker(target));
            }
            this._notifyChange(inst);
            this._adjustDate(target);
            //this.removeClass('ui-priority-secondary');
        }
        $("time.timeago").timeago();
        $('.Date').watermark('dd/mm/yyyy');

        try {
            $('.DateTime').datetimepicker({
                dateFormat: 'dd/mm/yy',
                timeFormat: 'h:mm tt',
                ampm: true
            });
        } catch (E) { }



        var BrowserVar = getBrowserVersion();

        $('.BrowserInformation').html(BrowserVar);
        //alert(BrowserVar);

        //var Dist = $('#ctl00_cphMain_DetailsView1_hidDistrict').val();
        //alert(Dist);
        //$('#ctl00_cphMain_DetailsView1_dboDistrict option[value="' + Dist + '"]').prop('selected', true);
        //  });

        $('#MainMenu').show();

        try {
            //cboType
            $(".Types").multiselect({
                noneSelectedText: "Select Type",
                selectedText: function (numChecked, numTotal, checkedItems) {
                    return numChecked + ' Type(s) Selected';
                }
            }).multiselectfilter({
                label: ""
            });
            //cboClusters
            $(".Clusters").multiselect({
                noneSelectedText: "Select Clusters",
                selectedText: function (numChecked, numTotal, checkedItems) {
                    return numChecked + ' Cluster(s) Selected';
                }
            }).multiselectfilter({
                label: ""
            });

            //cboBranches
            $(".Branches").multiselect({
                noneSelectedText: "Select Branch",
                selectedText: function (numChecked, numTotal, checkedItems) {
                    return numChecked + ' Branch(s) Selected';
                }
            }).multiselectfilter({
                label: ""
            });

            //cboDesignation
            $(".Designation").multiselect({
                noneSelectedText: "Select Designation",
                selectedText: function (numChecked, numTotal, checkedItems) {
                    return numChecked + ' Designation(s) Selected';
                }
            }).multiselectfilter({
                label: ""
            });

            //cboDepartments
            $(".Departments").multiselect({
                noneSelectedText: "Select Department",
                selectedText: function (numChecked, numTotal, checkedItems) {
                    return numChecked + ' Department(s) Selected';
                }
            }).multiselectfilter({
                label: ""
            });
        } catch (E) { }

        if ($('#cphTitle_hidPageUrl').val() == "Profile.aspx") {
            StartLastOnline();
        }


        var d = $('#cphTitle_GridViewNotice').html();
        if (d != null)
            $('<div></div>').append(d).dialog({ width: '560', modal: true, closeText: 'Close', title: 'Notice' });

        //        $(window).focus(function() {
        //            if ($('#ctl00_cphTitle_hidPageUrl').val() == "Profile.aspx") {
        //                setTimeout("getLastOnline()", 300);
        //            }
        //        });
    });
}

function StartLastOnline() {
    getLastOnline();
    setTimeout("StartLastOnline()", 30000);
}

function getLastOnline() {
    var Url = 'EmpOnlineStatus.ashx?empid=' + $('#cphTitle_hidEmpID').val();
    $('#DivLastOnlineStatus').load(Url);
}

function ShowWarning() {
    var BrowserVar = getBrowserVersion();

    if (BrowserVar == "Internet Explorer 6.0") {
        $('.caution').show();
        $('.cphMain').hide();        
    }
    else {
        $('.cphMain').show();
        $('.caution').hide();        
    }
}

function getBrowserVersion() {
    var browser = "unknown";
    var userAgent = navigator.userAgent.toLowerCase();
    if (userAgent.indexOf("opera") > -1)
        browser = "Opera";
    else if (userAgent.indexOf("konqueror") > -1)
        browser = "Konqueror";
    else if (userAgent.indexOf("firefox") > -1)
        browser = "Mozilla Firefox";
    else if (userAgent.indexOf("netscape") > -1)
        browser = "Netscape";
    else if (userAgent.indexOf("msie") > -1)
        browser = "Internet Explorer";
    else if (userAgent.indexOf("chrome") > -1)
        browser = "Google Chrome";
    else if (userAgent.indexOf("safari") > -1)
        browser = "Safari";

    //var ip = new java.net.InetAddress.getLocalHost();
    return browser + ' ' + $.browser.version;
}