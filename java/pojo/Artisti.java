package pojo;



import java.util.Date;

public class Artisti  implements java.io.Serializable {

	private Long idartist;
	private Albume albume;
	private GenuriMuzicale genurimuzicale;
	private String nume;
	private String prenume;
	private String data_lansare;
	private String trupa;

	public Artisti() {
	}

	public Artisti(Albume albume, GenuriMuzicale genurimuzicale, String nume, String prenume, String data_lansare, String trupa) {
		this.albume = albume;
		this.genurimuzicale = genurimuzicale;
		this.nume = nume;
		this.prenume = prenume;
		this.data_lansare = data_lansare;
		this.trupa = trupa;
	}

	public Long getIdartist() {
		return this.idartist;
	}

	public void setIdartist(Long idartist) {
		this.idartist = idartist;
	}
	public Albume getAlbume() {
		return this.albume;
	}

	public void setAlbume(Albume albume) {
		this.albume = albume;
	}
	public GenuriMuzicale getGenurimuzicale() {
		return this.genurimuzicale;
	}

	public void setGenurimuzicale(GenuriMuzicale genurimuzicale) {
		this.genurimuzicale = genurimuzicale;
	}
	public String getNume() {
		return this.nume;
	}

	public void setNume(String nume) {
		this.nume = nume;
	}
	public String getPrenume() {
		return this.prenume;
	}

	public void setPrenume(String prenume) {
		this.prenume = prenume;
	}
	public String getData_lansare() {
		return this.data_lansare;
	}

	public void setData_lansare(String data_lansare) {
		this.data_lansare = data_lansare;
	}
	public String getTrupa() {
		return this.trupa;
	}

	public void setTrupa(String trupa) {
		this.trupa = trupa;
	}
}