(function() {
    var HISTORY_ID, refreshData, refreshSorters;

    HISTORY_ID = 'tabular_sorter';

    $(document).on('ready page:load turbolinks:load', function() {
        return refreshSorters();
    });

    refreshSorters = function() {
        var path, sort_by, sort_order, tsParams;
        $('table th.sort').removeClass('asc').removeClass('desc');
        path = new CurrentPath();
        tsParams = path.get_param('ts');
        if (tsParams) {
            sort_by = path.get_param('ts.+by').split('%3A').join(':');
            sort_order = path.get_param('ts.+order');
            return $("table th.sort[data='" + sort_by + "']").addClass(sort_order);
        }
    };

    $(document).on('click', 'table th.sort', function() {
        var $sorter, path;
        path = new CurrentPath().remove_param('ts').remove_param('page').get_path();
        $('.wait_symbol').show();
        $sorter = $(this);
        return $.ajax(path, {
            data: {
                ts: {
                    by: $sorter.attr('data'),
                    order: ($sorter.hasClass('asc') ? 'desc' : 'asc')
                }
            },
            asynchronous: true,
            evalScripts: true,
            method: "get",
            success: function(data, textStatus, jqXHR) {
                var paginate, tableBody;
                var wrappedData = '<div>' + data + '</div>';
                tableBody = jQuery(wrappedData).find('.sortable_table tbody').html();
                paginate = jQuery(wrappedData).find('.refresh_pagination').html();
                refreshData(tableBody, paginate);
                history.pushState({
                    id: HISTORY_ID,
                    tbody: tableBody,
                    paginate: paginate
                }, null, this.url);
                $('.wait_symbol').hide();
                return refreshSorters();
            }
        });
    });

    refreshData = function(tbody, paginate) {
        $('.sortable_table tbody').html(tbody);
        $('.refresh_pagination').html(paginate);
    };

    $(window).on('popstate', function() {
        if (history.state.id === HISTORY_ID) {
            refreshData(history.state.tbody, history.state.paginate);
            return refreshSorters();
        }
    });

}).call(this);