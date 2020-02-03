﻿var JOBPOSITION = (function () {
    "use strict";

    var rootUrl = '/work/jobposition';
    var urlListDefault = rootUrl + '/list';
    var urlMyPositionStats = rootUrl + '/myPositionsStats';

    var selectors = {};
    var objs = {};
    var canInteract = false;
    var isIndex = false;
    var isNew = false;
    var isDetails = false;
    var isCompany = false;

    function init() {
        setSelectors();
        cacheObjects();

        bindAll();

        canInteract = objs.container.find(selectors.canInteract).val();
        isCompany = objs.container.find(selectors.jobProfile).val() === 'Company';
        isNew = window.location.href.indexOf('add') > -1;
        isDetails = window.location.href.indexOf('details') > -1;
        isIndex = !isNew && !isDetails;

        if (isIndex) {
            if (isCompany) {
                var url = $(selectors.btnListMine).data('url');
                loadJobPositions(false, url);
            }
            else {
                loadJobPositions(false, urlListDefault);
            }
            loadMyJobPositionStats(urlMyPositionStats);
        }
    }

    function setSelectors() {
        selectors.controlsidebar = '.control-sidebar';
        selectors.canInteract = '#caninteract';
        selectors.jobProfile = '#jobprofile';
        selectors.container = '.content';
        selectors.containerDetails = '#containerdetails';
        selectors.containerList = '#containerlist';
        selectors.list = '#divList';
        selectors.divListItem = '.jobposition-item';
        selectors.btnNewJobPosition = '#btn-jobposition-new';
        selectors.btnListMine = '#btn-jobposition-listmine';
        selectors.form = '#frmJobPositionSave';
        selectors.btnSave = '#btnPostJobPosition';
        selectors.btnEditJobPosition = '.btnEditJobPosition';
        selectors.btnDeleteJobPosition = '.btnDeleteJobPosition';
        selectors.btnApply = '#btnApply';
        selectors.chkRemote = '#Remote';
        selectors.location = '#Location';
        selectors.myPositionStats = '#divMyPositionStats';
        selectors.datepicker = '.datepicker';
    }

    function cacheObjects() {
        objs.controlsidebar = $(selectors.controlsidebar);
        objs.container = $(selectors.container);
        objs.containerDetails = $(selectors.containerDetails);
        objs.containerList = $(selectors.containerList);
        objs.list = $(selectors.list);
        objs.myPositionStats = $(selectors.myPositionStats);
        objs.btnApply = $(selectors.btnApply);
    }

    function cacheObjectsCreateEdit() {
        objs.location = $(selectors.location);
    }

    function setCreateEdit() {
        cacheObjectsCreateEdit();

        $(selectors.datepicker).datepicker();
    }

    function bindAll() {
        bindBtnNewJobPosition();
        bindBtnListMine();
        bindBtnSaveForm();
        bindBtnApply();
        bindEditJobPosition();
        bindDeleteJobPosition();
        bindRemoteChange();
    }

    function bindBtnNewJobPosition() {
        objs.controlsidebar.on('click', selectors.btnNewJobPosition, function () {
            if (canInteract) {
                loadNewJobPositionForm();
                ControlSidebar.Toggle();
            }
        });
    }

    function bindBtnListMine() {
        objs.container.on('click', selectors.btnListMine, function () {
            var url = $(this).data('url');
            if (canInteract) {
                loadJobPositions(true, url);
            }
        });
    }

    function bindBtnSaveForm() {
        objs.containerDetails.on('click', selectors.btnSave, function () {
            var valid = objs.form.valid();
            if (valid && canInteract) {
                submitForm();
            }
        });
    }


    function bindEditJobPosition() {
        objs.containerList.on('click', selectors.btnEditJobPosition, function (e) {
            e.preventDefault();
            var url = $(this).data('url');

            if (canInteract) {
                loadEditForm(url);
            }
        });
    }


    function bindDeleteJobPosition() {
        objs.containerList.on('click', selectors.btnDeleteJobPosition, function (e) {
            e.preventDefault();

            var btn = $(this);
            var url = $(this).data('url');
            var msg = btn.data('confirmationmessage');
            var confirmationTitle = btn.data('confirmationtitle');
            var confirmationButtonText = btn.data('confirmationbuttontext');
            var cancelButtonText = btn.data('cancelbuttontext');

            ALERTSYSTEM.ShowConfirmMessage(confirmationTitle, msg, confirmationButtonText, cancelButtonText, function () {
                $.ajax({
                    url: url,
                    type: 'DELETE'
                }).done(function (response) {
                    if (response.success) {
                        btn.closest(selectors.divListItem).remove();
                        loadJobPositions(false, urlListDefault);

                        loadMyJobPositionStats(urlMyPositionStats);

                        if (response.message) {
                            ALERTSYSTEM.ShowSuccessMessage(response.message, function () {
                                if (response.url) {
                                    window.location = response.url;
                                }
                            });
                        }
                    }
                    else {
                        ALERTSYSTEM.ShowWarningMessage(response.message);
                    }
                });
            });
        });
    }


    function bindRemoteChange() {
        objs.containerDetails.on('change', selectors.chkRemote, function (e) {
            var isRemote = $(this).is(':checked');

            if (isRemote) {
                objs.location.val('').hide();
            }
            else {
                objs.location.val('').show();
            }
        });
    }

    function bindBtnApply() {
        objs.container.on('click', selectors.btnApply, function (e) {
            e.preventDefault();

            var btn = $(this);
            var originalText = btn.html();

            btn.html(MAINMODULE.Default.SpinnerBtn);

            var url = btn.data('url');

            if (canInteract) {
                apply(url, function (response) {
                    if (response.success === true) {
                        btn.html('...');
                    }
                    else {
                        btn.html(originalText);
                    }
                    console.log(response);
                });
            }

            return false;
        });
    }

    function loadJobPositions(fromControlSidebar, url) {
        objs.list.html(MAINMODULE.Default.Spinner);
        objs.containerDetails.html('');
        objs.containerDetails.hide();

        $.get(url, function (data) {
            if (fromControlSidebar) {
                objs.list.html(data);
                objs.containerList.show();
                cacheObjects();
            }
            else {
                objs.list.html(data);
            }
        });
    }


    function loadMyJobPositionStats(url) {
        objs.myPositionStats.html(MAINMODULE.Default.SpinnerTop);

        $.get(url, function (data) {
            objs.myPositionStats.html(data);
        });
    }

    function loadNewJobPositionForm() {
        objs.containerDetails.html(MAINMODULE.Default.Spinner);
        objs.containerList.hide();

        $.get(rootUrl + "/new", function (data) {
            objs.containerDetails.html(data);
            objs.containerDetails.show();

            objs.form = $(selectors.form);

            $.validator.unobtrusive.parse(selectors.form);
            setCreateEdit();
        });
    }

    function apply(url, callback) {
        $.post(url).done(function (response) {
            if (response.success === true) {
                if (callback) {
                    callback(response);
                }
                ALERTSYSTEM.ShowSuccessMessage(response.message, function () {
                    if (response.url) {
                        window.location = response.url;
                    }
                });
            }
            else {
                ALERTSYSTEM.ShowWarningMessage(response.message);
            }
        });
    }

    function loadEditForm(url) {
        objs.containerDetails.html(MAINMODULE.Default.Spinner);
        objs.containerList.hide();

        $.get(url, function (data) {
            objs.containerDetails.html(data);
            objs.containerDetails.show();

            objs.form = $(selectors.form);

            $.validator.unobtrusive.parse(objs.form);
            setCreateEdit();
        });
    }

    function submitForm(callback) {
        var url = objs.form.attr('action');

        var data = objs.form.serialize();

        $.post(url, data).done(function (response) {
            if (response.success === true) {
                if (callback) {
                    callback();
                }
                ALERTSYSTEM.ShowSuccessMessage("Awesome!", function (isConfirm) {
                    window.location = response.url;
                });
            }
            else {
                ALERTSYSTEM.ShowWarningMessage("An error occurred! Check the console!");
            }
        });
    }

    return {
        Init: init
    };
}());

$(function () {
    JOBPOSITION.Init();
});