$(document).ready(function () {

    var radar2 = new RGraph.Radar({
        id: 'cvs',
        data: speakers,
        options: {
            labels: labels,
            tooltips: tooltips,
            clearto: 'white',
            background: {
                circles: {
                    poly: true,
                    spacing: 30
                }
            },
            colors: ['rgba(255,0,0,0.25)','rgba(255,255,0,0.25)'],
            axes: {
                color: 'transparent'
            },
            highlights: true,
            strokestyle: ['red','black']
        }
    }).on('beforedraw', function (obj) {
        RGraph.clear(obj.canvas, 'white');
    }).grow()
});